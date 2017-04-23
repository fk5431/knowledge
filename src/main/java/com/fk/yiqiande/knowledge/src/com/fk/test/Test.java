package com.fk.test;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import com.fk.elasticsearch.DataFactory;
import com.fk.elasticsearch.ElasticSearchHandler;
import com.fk.elasticsearch.File;
import com.fk.elasticsearch.JsonUtil;
import com.fk.utils.JdbcUtil;

public class Test {

	public static void main(String[] args) {
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "insert into file(uid,fname,uuidname,title,tags,ftypeid,uploadtime,abstracString,introduction,url_image,url,url_transforms,ktypeid) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?);";
		String[] fname = new String[]{"练太极拳有什么样好处？.doc","铃声-MiMiMi小黄人版.mp3","C_-字符串与二进制相互转换.txt","梅西.zip"
				,"VID20151114114437.mp4","517305085917428694.jpg","软件缺陷分类标准.xls","Linux系统JDK安装和配置.doc"
				,"毕业论文答辩王振广.ppt","ElasticsearchJava教程.pdf","java.docx","CSS2.chm","哈辉-子衿(相和歌).mp3","帆船.psd"};
		String[] uuid = new String[]{"a3043ba5-ea3d-416c-bf84-bde32bcb1344_练太极拳有什么样好处？.doc",
				"7ccad415-28a2-4957-aee4-cd555056aca9_铃声-MiMiMi小黄人版.mp3",
				"35a91096-77ca-4f2c-be8a-608612ff9a39_C_-字符串与二进制相互转换.txt","e50879ea-2fa2-4b15-83a8-ed7f8a2cfd74_梅西.zip"
				,"1c97afd0-53b7-44c0-b191-2706a155bafe_VID20151114114437.mp4",
				"72df9430-5c6a-41be-b097-92259c5f0399_517305085917428694.jpg",
				"cd4ad6f8-c8fe-4896-ae9d-4e7dfd1f0973_软件缺陷分类标准.xls",
				"2134dffe-d267-4b5a-ba11-0a234fbeddf5_Linux系统JDK安装和配置.doc"
				,"d2602c31-439e-4a4f-8f9e-862ca5a770d8_毕业论文答辩王振广.ppt",
				"34ec3d07-3272-4665-80fb-5eec8ae2ccfa_ElasticsearchJava教程.pdf",
				"eb12b350-f289-40fa-a95a-82f28660efb0_java.docx",
				"4fea879d-be6d-4d3f-8bb3-921e5819f503_CSS2.chm",
				"b3c971ea-3ffc-4d77-a8eb-1e8c62d2981e_哈辉-子衿(相和歌).mp3","b4ba1149-ea4e-4e5c-b0ef-944d92edc796_帆船.psd"};
		String[] title = new String[]{"练太极拳有什么样好处","铃声-MiMiMi小黄人版","C_-字符串与二进制相互转换","梅西"
				,"银杏树","华胥引","软件缺陷分类标准","Linux系统JDK安装和配置"
				,"毕业论文","Elasticsearch Java","java","css2","哈辉-子衿(相和歌)","帆船"};

		
		String[] tags = new String[]{
				"太极拳, 运动",
				"《神偷奶爸》, 小黄人, 手机铃声",
				"c语言, 二进制, 字符串",
				"梅西, 球类",
				"山东科技大学, 银杏树, 秋天, 落叶",
				"华胥引, 美图",
				"软件, 缺陷",
				"Linux, JDK",
				"毕业论文",
				"Elasticsearch Java",
				"java, 面试, 习题",
				"css, html, 计算机",
				"古风音乐",
				"帆船手绘"};

		String[] ftypeid = new String[]{"0",
		"2",
		"0",
		"4",
		"3",
		"1",
		"0",
		"0",
		"0",
		"0",
		"0",
		"0",
		"2",
		"1"};
		String[] abstracstring = new String[]{"太极拳是我国宝贵的民族文化遗产，多年来太极拳就在人民群众中间流传，它是我国武术运动中的重要拳种，它不仅具有强健身体，自卫防身作用，而且有防治疾病和延年益寿的医疗价值。",
				"《神偷奶爸》中小黄人配音萌萌手机铃声，可设置为来电铃声，电影原版配音。",
				"c语言字符与二进制的相互转换代码，将二进制转换成字符串以及将字符串转换为二进制。",
				"梅西各个比赛当中的精彩瞬间，有不少他踢出关键性一球的美图。四度摘得金球奖的梅西，从数据、奖杯、荣誉到技术、天赋、球品，无不是这个星球的一大翘楚。但他还缺一座世界杯，足球世界如果非要以世界杯作为称王的标准，那么，他距离所谓的“伟大”，就是一座世界杯的距离",
				"秋天山东科技大学b餐门口满眼金黄的银杏树，清风吹，银杏叶簌簌地落下，满地都是金色。",
				"华胥引歌词与书里句子配图，好看唯美的封面图。",
				"规范的报价单对于一个公司的数据统计是很重要的，报价单中包含的内容有产品型号、规格、单价、数量、金额等。",
				"jdk就是java开发工具，提供了java的api和java的运行时环境jre。只要你不需要运行java的程序，就不用jdk。需要java环境的，比如eclipse啊一些软件，不用这些需要jre的软件的话完全不用装jdk",
				"软件公司结合自己公司的软件工程过程，开发出一款符合自己业务流程的项目管理系统进而更方便快捷准确地对软件工程的各个过程阶段进行详细的管理、监控，控制项目成本和项目进度。",
				"ElasticSearch是一个基于Lucene的搜索服务器。它提供了一个分布式多用户能力的全文搜索引擎，基于RESTful web接口。Elasticsearch是用Java开发的，并作为Apache许可条款下的开放源码发布，是当前流行的企业级搜索引擎。设计用于云计算中，能够达到实时搜索，稳定，可靠，快速，安装使用方便。",
				"本文我们将要讨论Java面试中的各种不同类型的面试题，它们可以让雇主测试应聘者的Java和通用的面向对象编程的能力。",
				"本手册针对的是已有一定网页设计制作经验的读者。其目的是提供最新最全的样式表内容的快速索引及注释。所以对于样式表的基础知识，在此仅简单介绍，恕不赘述。",
				"青青子衿⑴，悠悠我心。纵我不往，子宁不嗣音⑵？  青青子佩⑶，悠悠我思。纵我不往，子宁不来？  挑兮达兮⑷，在城阙兮⑸。一日不见，如三月兮。",
				"蓝色底纹白色帆船，远航的帆船与大海图"};
		String[] introduction = new String[]{
			"<span style=\"color: rgb(107, 165, 74);\">练习太极拳的好处很多，因为它的每一个动作差不多都是全身运动，所以身体的每一部分都得到了活动的机会。太极拳要求动作与呼吸自然结合，因此能发展呼吸肌增加肺活量；其运动量大而不剧烈，能促进血液循环，发展心脏肌能，使心脏跳动缓和而有力，既减少淤血现象，又能减少动脉硬化之弊；</span>",
			"<span style=\"color: rgb(239, 198, 49);\">电影里为这些小黄人配音的正是影片的另一位导演皮艾尔·科芬。科芬回忆说，最开始小黄人的配音并不顺利，于是他自己走进录音棚试了试。他当时对制片人麦雷丹德瑞说：“我来试试吧，我只想告诉他们小黄人的声音应该是什么样的。”不过当麦雷丹德瑞听了导演的配音以后，这位制片人当场拍板，由导演亲自上阵为小黄人配音。</span>",
			"<span style=\"color: rgb(57, 123, 33);\">字符串b中的每个字符在内存中都占有一个字节(1 Byte = 8 bits)的空间，将若干个(3个)字节中的内容转换成二进制的数字(字符串\"100\"去掉双引号后是一个二进制的数字100)</span>",
			"梅西各个比赛当中的精彩瞬间，有不少他踢出关键性一球的美图。四度摘得金球奖的梅西，从数据、奖杯、荣誉到技术、天赋、球品，无不是这个星球的一大翘楚。但他还缺一座世界杯，足球世界如果非要以世界杯作为称王的标准，那么，他距离所谓的“伟大”，就是一座世界杯的距离",
			"<span style=\"color: rgb(247, 173, 107);\">										站在我们班门口,每天都能看到银杏树在发生的每一个变化.不久之前,他它那郁郁葱葱的树叶渐渐变黄,最终称了金黄色,好像长着一头金发的慈祥老人.刮北风的时候,银杏树金黄的叶子开始飞舞,那样子可真是美极了：一阵风吹过,金黄色的银杏叶想快乐的蝴蝶一样,成群结队地飞起来,它们忽而旋转,忽而高飞,忽而轻轻降落……整个操场简直成了给他们展示风姿的大舞台,那“呼呼”的风声也仿佛成了优美的音乐.最后,它们纷纷落到地上,整个操场好像被盖上了一层金色的地毯.</span>",
			"<span style=\"color: rgb(57, 132, 198);\">这是一个发生在乱世的奇幻故事。城破之日，叶蓁以身殉国，依靠鲛珠死而复生时，高人传以听琴入梦之术。她只是一个“轻若尘埃，一拂即逝”的君禹山君拂，而他两年后再次与她相遇时,用的也不是陈国世子苏誉的身份，他只是一个被她救下的蓝衣公子。当她弹起华胥调，便生死人肉白骨(生死人肉白骨一般用来形容医术高超，妙手回春之意)，探入梦境与回忆。幻术构成的曲谱里，尽是人世的辛酸与苦涩。而她与他一次一次于幻境中相遇，身份两重，缘也两重。清平华胥调，能不能让每个人追回旧日的思念，不再悲伤？</span>",
			"<span style=\"color: rgb(132, 99, 0);\">规范的报价单对于一个公司的数据统计是很重要的，报价单中包含的内容有产品型号、规格、单价、数量、金额等。规范的报价单对于一个公司的数据统计是很重要的，报价单中包含的内容有产品型号、规格、单价、数量、金额等。规范的报价单对于一个公司的数据统计是很重要的，报价单中包含的内容有产品型号、规格、单价、数量、金额等。规范的报价单对于一个公司的数据统计是很重要的，报价单中包含的内容有产品型号、规格、单价、数量、金额等。</span>",
			"<span style=\"color: rgb(8, 82, 148);\">										Linux是一套免费使用和自由传播的类Unix操作系统，是一个基于POSIX和UNIX的多用户、多任务、支持多线程和多CPU的操作系统。它能运行主要的UNIX工具软件、应用程序和网络协议。它支持32位和64位硬件。Linux继承了Unix以网络为核心的设计思想，是一个性能稳定的多用户网络操作系统。Linux操作系统诞生于1991 年10 月5 日（这是第一次正式向外公布时间）。Linux存在着许多不同的Linux版本，但它们都使用了Linux内核。Linux可安装在各种计算机硬件设备中，比如手机、平板电脑、路由器、视频游戏控制台、台式计算机、大型机和超级计算机。严格来讲，Linux这个词本身只表示Linux内核，但实际上人们已经习惯了用Linux来形容整个基于Linux内核，并且使用GNU 工程各种工具和数据库的操作系统。</span>",
			"										本文针对东软系统集成有限公司实施一部的项目管理业务，开发出一款与实际应用相结合的适合本公司项目管理流程的项目管理系统。简化的项目管理的流程环节，方便用户随时随地通过Internet浏览器访问系统，进行日常工作。优化项目经理维护项目信息和成本管理流程，方便项目经理及时更新项目进度和成本控制，监控项目组成员日常项目计划与实际完成任务。部门直属领导方便随时查看各项目进度信息、成本分析、产值分析及公司员工人员饱和度分析。提高了项目管理各流程的效率，做到及时地对项目各阶段进行详细的管理与监控，确保对各个项目的盈亏情况做好实时监控和控制",
			"<span style=\"color: rgb(239, 198, 49);\">										cluster代表一个集群，集群中有多个节点，其中有一个为主节点，这个主节点是可以通过选举产生的，主从节点是对于集群内部来说的。es的一个概念就是去中心化，字面上理解就是无中心节点，这是对于集群外部来说的，因为从外部来看es集群，在逻辑上是个整体，你与任何一个节点的通信和与整个es集群通信是等价的。shards代表索引分片，es可以把一个完整的索引分成多个分片，这样的好处是可以把一个大的索引拆分成多个，分布到不同的节点上。构成分布式搜索。分片的数量只能在索引创建前指定，并且索引创建后不能更改。replicas代表索引副本，es可以设置多个索引的副本，副本的作用一是提高系统的容错性，当某个节点某个分片损坏或丢失时可以从副本中恢复。二是提高es的查询效率，es会自动对搜索请求进行负载均衡。标签：软件，计算机学</span>",
			"<span style=\"color: rgb(165, 74, 123);\">										Java是一个支持并发、基于类和面向对象的计算机编程语言。下面列出了面向对象软件开发的优点：代码开发模块化，更易维护和修改。代码复用。增强代码的可靠性和灵活性。增加代码的可理解性。面向对象编程有很多重要的特性，比如：封装，继承，多态和抽象。下面的章节我们会逐个分析这些特性。</span>",
			"<span style=\"color: rgb(156, 0, 0);\">本手册针对的是已有一定网页设计制作经验的读者。其目的是提供最新最全的样式表内容的快速索引及注释。所以对于样式表的基础知识，在此仅简单介绍，恕不赘述。本手册的升级信息与版权声明请参阅关于本书页面。本手册中专用词汇请参阅中英文词汇对照表。限于篇幅，对于一些过于繁杂的相关内容，如动态样式属性（DynamicProperties），滤镜（Filters），行为（Behaviors）请参阅我的其它相关著作。 本书中涉及到的所有HTML对象（Object，Element），HTML特性（Attributes）和属性（Properties）请参阅我的相关著作。什么是样式表CSS是Cascading Style Sheet 的缩写。译作「层叠样式表单」。是用于（增强）控制网页样式并允许将样式信息与网页内容分离的一种标记性语言。如何将样式表加入您的网页你可以用以下三种方式将样式表加入您的网页。而最接近目标的样式定义优先权越高。高优先权样式将继承低优先权样式的未重叠定义但覆盖重叠的定义。例外请参阅important声明。</span>",
			"<div><span style=\"line-height: 1.42857; color: rgb(107, 165, 74);\"> 这首诗写一个女子在城楼上等候她的恋人。全诗三章，采用倒叙手法。前两章以“我”的口气自述怀人。“青青子衿”，“青青子佩”，是以恋人的衣饰借代恋人。对方的衣饰给她留下这么深刻的印象，使她念念不忘，可想见其相思萦怀之情。如今因受阻不能前去赴约，只好等恋人过来相会，可望穿秋水，不见影儿，浓浓的爱意不由转化为惆怅与幽怨：“纵然我没有去找你，你为何就不能捎个音信？纵然我没有去找你，你为何就不能主动前来？”第三章点明地点，写她在城楼上因久候恋人不至而心烦意乱，来来回回地走个不停，觉得虽然只有一天不见面，却好像分别了三个月那么漫长。这首诗是《诗经》众多情爱诗歌作品中较有代表性的一篇，它鲜明地体现了那个时代的女性所具有的独立、自主、平等的思想观念和精神实质，女主人公在诗中大胆表达自己的情感，即对情人的思念。这在《诗经》以后的历代文学作品中是少见的。由《国风·郑风·子衿》改编的一首音乐</span><br></div>",
			"<span style=\"color: rgb(8, 82, 148);\">自制的psd格式的图片，手绘白色帆船和大海</span>"
		};
				String[] url_image = new String[]{"img/txt.png",
				"img/m.png",
				"img/txt.png",
				"img/z.png",
				"upload/13/3/305/1c97afd0-53b7-44c0-b191-2706a155bafe_VID20151114114437.mp4.jpg",
				"upload/61/1/-415/72df9430-5c6a-41be-b097-92259c5f0399_517305085917428694.jpg",
				"img/txt.png",
				"img/txt.png",
				"img/txt.png",
				"img/txt.png",
				"img/txt.png",
				"img/txt.png",
				"img/m.png",
				"upload/61/1/-398/b4ba1149-ea4e-4e5c-b0ef-944d92edc796_帆船.psd"};

				String[] url = new String[]{"D:/upload/32/0/-249",
				"D:/upload/63/2/-151",
				"D:/upload/57/0/-91",
				"D:/upload/72/4/-75",
				"D:/upload/13/3/305",
				"D:/upload/61/1/-415",
				"D:/upload/57/0/-455",
				"D:/upload/57/0/-322",
				"D:/upload/57/0/-282",
				"D:/upload/57/0/13",
				"D:/upload/57/0/-72",
				"D:/upload/57/0/-411",
				"D:/upload/63/2/-348",
				"D:/upload/61/1/-398"};
				
				String[] url_transforms = new String[]{"upload/32/0/-249/a3043ba5-ea3d-416c-bf84-bde32bcb1344_练太极拳有什么样好处？.swf",
						"D:/upload/63/2/-151",
						"",
						null,
						"upload/13/3/305/1c97afd0-53b7-44c0-b191-2706a155bafe_VID20151114114437.flv",
						"upload/61/1/-415/72df9430-5c6a-41be-b097-92259c5f0399_517305085917428694.jpg",
						"upload/57/0/-455/cd4ad6f8-c8fe-4896-ae9d-4e7dfd1f0973_软件缺陷分类标准.swf",
						"upload/57/0/-322/2134dffe-d267-4b5a-ba11-0a234fbeddf5_Linux系统JDK安装和配置.swf",
						"upload/57/0/-282/d2602c31-439e-4a4f-8f9e-862ca5a770d8_毕业论文答辩王振广.swf",
						"upload/57/0/13/34ec3d07-3272-4665-80fb-5eec8ae2ccfa_ElasticsearchJava教程.swf",
						"upload/57/0/-72/eb12b350-f289-40fa-a95a-82f28660efb0_java.swf",
						"",
						"upload/63/2/-348/b3c971ea-3ffc-4d77-a8eb-1e8c62d2981e_哈辉-子衿(相和歌).mp3",
						"upload/61/1/-398/b4ba1149-ea4e-4e5c-b0ef-944d92edc796_帆船.psd"};
				String[] ktypeid = new String[]{"32",
						"63",
						"57",
						"72",
						"13",
						"61",
						"57",
						"57",
						"57",
						"57",
						"57",
						"57",
						"63",
						"61"};
		DataFactory factory = new DataFactory();
		
		ElasticSearchHandler esHandler = new ElasticSearchHandler();
		
		try {
			int j = 0;
			for(int k=0;k<100;k++){
			Object[][] params = new Object[10000][13];
			List<String> jsondata = new ArrayList<String>();
			esHandler.createIndexResponse(esHandler.getIndexname(),
					esHandler.getType(), jsondata);
			for(int i=0;i<10000;i++){
			//	for(int k=0;k<10000;k++){
					params[i][0] = 2; 
					params[i][1] = fname[j]; 
					params[i][2] = uuid[j]; 
					params[i][3] = title[j]; 
					params[i][4] = tags[j]; 
					params[i][5] = ftypeid[j]; 
					params[i][6] = new Timestamp(System.currentTimeMillis()); 
					params[i][7] = abstracstring[j]; 
					params[i][8] = introduction[j]; 
					params[i][9] = url_image[j]; 
					params[i][10] = url[j]; 
					params[i][11] = url_transforms[j]; 
					params[i][12] = ktypeid[j]; 
					String data = JsonUtil.obj2JsonData(new File(k*10000+i+15, 2, title[j], tags[j], abstracstring[j], introduction[j], ""));
					jsondata.add(data);
			//	}
				
//				runner.update(sql, new Object[]{2,
//					fname[j],uuid[j],title[j],tags[j],ftypeid[j],
//					new Timestamp(System.currentTimeMillis()),abstracstring[j],introduction[j],url_image[j]
//					,url[j],url_transforms[j],ktypeid[j]});
				//String data = JsonUtil.obj2JsonData(new File(i+16, 2, title[j], tags[j], abstracstring[j], introduction[j], ""));
			//	jsondata.add(data);
				j++;
				if(j == 14)
					j = 0;
			//	System.out.println(i);
			}
			runner.batch(sql, params);
			esHandler.createIndexResponse(esHandler.getIndexname(),esHandler.getType(), jsondata);
			System.out.println(k);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
