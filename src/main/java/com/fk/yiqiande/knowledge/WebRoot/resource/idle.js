(function($){$.idleTimer=function f(newTimeout){var idle=false,enabled=true,timeout=30000,events='mousemove keydown DOMMouseScroll mousewheel mousedown',toggleIdleState=function(){idle=!idle;f.olddate=+new Date;$(document).trigger($.data(document,'idleTimer',idle?"idle":"active")+'.idleTimer');},stop=function(){enabled=false;clearTimeout($.idleTimer.tId);$(document).unbind('.idleTimer');},handleUserEvent=function(){clearTimeout($.idleTimer.tId);if(enabled){if(idle){toggleIdleState();}
$.idleTimer.tId=setTimeout(toggleIdleState,timeout);}};f.olddate=f.olddate||+new Date;if(typeof newTimeout=="number"){timeout=newTimeout;}else if(newTimeout==='destroy'){stop();return this;}else if(newTimeout==='getElapsedTime'){return(+new Date)-f.olddate;}
$(document).bind($.trim((events+' ').split(' ').join('.idleTimer ')),handleUserEvent);$.idleTimer.tId=setTimeout(toggleIdleState,timeout);$.data(document,'idleTimer',"active");};})(jQuery);(function($,win){var idleTimeout={init:function(element,resume,options){var self=this,elem;this.warning=elem=$(element);this.resume=$(resume);this.options=options;this.countdownOpen=false;this.failedRequests=options.failedRequests;this._startTimer();this.title=document.title;$.data(elem[0],'idletimeout',this);$.idleTimer(options.idleAfter*1000);$(document).bind("idle.idleTimer",function(){if($.data(document,'idleTimer')==='idle'&&!self.countdownOpen){self._stopTimer();self.countdownOpen=true;self._idle();}});this.resume.bind("click",function(e){e.preventDefault();win.clearInterval(self.countdown);self.countdownOpen=false;self._startTimer();self._keepAlive(false);options.onResume.call(self.warning);});},_idle:function(){var self=this,options=this.options,warning=this.warning[0],counter=options.warningLength;options.onIdle.call(warning);options.onCountdown.call(warning,counter);this.countdown=win.setInterval(function(){if(--counter===0){window.clearInterval(self.countdown);options.onTimeout.call(warning);}else{options.onCountdown.call(warning,counter);document.title=options.titleMessage.replace('%s',counter+(counter>1?" seconds":" second"))+self.title;document.title=options.titleMessage.replace('%m',(Math.ceil(counter/60))+(counter>60?" minutes":" minute"))+self.title;}},1000);},_startTimer:function(){var self=this;this.timer=win.setTimeout(function(){self._keepAlive();},this.options.pollingInterval*1000);},_stopTimer:function(){this.failedRequests=this.options.failedRequests;win.clearTimeout(this.timer);},_keepAlive:function(recurse){var self=this,options=this.options;document.title=self.title;if(typeof recurse==="undefined"){recurse=true;}
if(!this.failedRequests){this._stopTimer();options.onAbort.call(this.warning[0]);return;}
$.ajax({timeout:options.AJAXTimeout,url:options.keepAliveURL,error:function(){self.failedRequests--;},success:function(response){if($.trim(response)!==options.serverResponseEquals){self.failedRequests--;}},complete:function(){if(recurse){self._startTimer();}}});}};$.idleTimeout=function(element,resume,options){idleTimeout.init(element,resume,$.extend($.idleTimeout.options,options));return this;};$.idleTimeout.options={warningLength:30,keepAliveURL:"",serverResponseEquals:"OK",idleAfter:30,pollingInterval:10,failedRequests:5,AJAXTimeout:250,titleMessage:'Warning: %s seconds until log out | ',onTimeout:$.noop,onIdle:$.noop,onCountdown:$.noop,onResume:$.noop,onAbort:$.noop};})(jQuery,window);