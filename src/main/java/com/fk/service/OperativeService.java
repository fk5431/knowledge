package com.fk.service;

import com.fk.bean.*;
import com.fk.dao.*;
import com.fk.util.*;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by fengkai on 25/04/17.
 */
@Service("operativeService")
public class OperativeService {

    @Autowired
    UserDao userDao;

    @Autowired
    FtypeDao ftypeDao;

    @Autowired
    KtypeDao ktypeDao;

    @Autowired
    FileDao fileDao;

    @Autowired
    ReviewDao reviewDao;

    private Logger logger = LoggerFactory.getLogger(UserService.class);


    public void adduser(UserBean userBean, Map<String, Object> map) {
        try {
            UserBean user = userDao.selectByEmail(userBean.getUemail());
            UserBean username = userDao.selectByName(userBean.getUname());
            if (user != null) {
                map.put(CommonConst.ERRORCODE, "1");
                return;
            } else if (username != null) {
                map.put(CommonConst.ERRORCODE, "4");
                return;
            }
            userDao.insertSelective(userBean);
        } catch (Exception e) {
            logger.error("OperativeService.adduser error");
            e.printStackTrace();
        }

    }

    public void addFtype(FtypeBean ftypeBean, Map<Object, String> map) {
        try {
            FtypeBean ftype = ftypeDao.selectByName(ftypeBean.getFtypename());
            if (ftype != null) {
                map.put(CommonConst.ERRORCODE, "5");
                return;
            }
            ftypeDao.insertSelective(ftypeBean);
        } catch (Exception e) {
            logger.error("OperativeService.addFtype error");
            e.printStackTrace();
        }

    }

    public void addKtype(KtypeBean ktypeBean, MultipartFile file, Map<Object, String> map) {
        try {
            KtypeBean ftype = ktypeDao.selectByName(ktypeBean.getKtype());
            if (ftype != null) {
                map.put(CommonConst.ERRORCODE, "5");
                return;
            }

            String filename = file.getOriginalFilename();
            String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
            filename = String.valueOf(System.currentTimeMillis()) + filename;
            path = path + "upload/ktype";
            File upload = new File(path, filename);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), upload);
            } catch (IOException e) {
                e.printStackTrace();
            }
            String url = "/knowledge/upload/ktype/" + filename;
            ktypeBean.setKtypeurl(url);

            ktypeDao.insertSelective(ktypeBean);
        } catch (Exception e) {
            map.put(CommonConst.ERRORCODE, "7");
            logger.error("OperativeService.addFtype error");
            e.printStackTrace();
        }

    }

    public void fileform(Map<String, Object> map) {
        try {
            List<FtypeBean> ftypeBeans = ftypeDao.selectAll();
            List<KtypeBean> ktypeBeans = ktypeDao.selectAll();
            map.put("ftype", ftypeBeans);
            map.put("ktype", ktypeBeans);

        } catch (Exception e) {
            logger.error("OperativeService.addFtype error");
            e.printStackTrace();
        }
    }

    public void addFile(FileBean fileBean, MultipartFile file, Map<String, Object> map) {
        if (file != null) {
            String filename = file.getOriginalFilename();

            fileBean.setFname(filename);

            String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
            filename = String.valueOf(System.currentTimeMillis()) + filename;
            path = path + "upload";
            File upload = new File(path, filename);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), upload);
            } catch (IOException e) {
                e.printStackTrace();
            }

            String url = path + "\\" + filename;
            fileBean.setUrl(url);
            fileBean.setUuidname(filename);
            if (fileBean.getCanTransforms() == 0) {
                transforms(file, fileBean);
            } else {
                fileBean.setUrlTransforms(fileBean.getUrl());
            }

        } else {
            fileBean.setUrlImage("");
            fileBean.setUrlTransforms(fileBean.getUrl());
            fileBean.setUrl("");
            fileBean.setUuidname("");
            fileBean.setFname("");
        }

        if(fileBean.getUrlImage() == null || fileBean.getUrlImage().equals("")) {
            int ktypeId = fileBean.getKtypeid();
            KtypeBean k = ktypeDao.selectByPrimaryKey(ktypeId);
            fileBean.setUrlImage(k.getKtypeurl());
        }

        //tags
        String tags = fileBean.getTags();
        StringBuffer sb = new StringBuffer();
        boolean flag = false;
        for (String tag : tags.split(",")) {
            if (flag == false) {
                sb.append(tag);
                flag = true;
            } else {
                sb.append(CommonConst.SPLITOR);
                sb.append(tag);
            }
        }
        fileBean.setTags(sb.toString());


        String other = extract(fileBean);
        fileDao.insertSelective(fileBean);

        ESFileBean esFileBean = new ESFileBean(fileBean);
        esFileBean.setOther(other);
        CElastic.inital();
        CElastic.elastic.insert(esFileBean);


    }

    public String extract(FileBean fileBean) {
        String word = "";
        String suffix = fileBean.getFname().substring(fileBean.getFname().lastIndexOf(".")+1);
        logger.info("===================================trasforms, suffix{[]}", suffix);
        if(PropertiesStr.office.contains(suffix)){
            if (suffix.equalsIgnoreCase("doc") || suffix.equalsIgnoreCase("dot")) {
                try {
                    word = ExtractText.extractTextFromDOC(fileBean.getUrl());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else if (suffix.equalsIgnoreCase("docx")
                    || suffix.equalsIgnoreCase("docm")
                    || suffix.equalsIgnoreCase("dotx")) {
                try {
                    word = ExtractText.extractTextFromDOC2007(fileBean.getUrl());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (suffix.equalsIgnoreCase("xls")) {
                try {
                    word = ExtractText.extractTextFromXLS(fileBean.getUrl());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else if (suffix.equalsIgnoreCase("xlsx")
                    || suffix.equalsIgnoreCase("xlsm")) {
                try {
                    word = ExtractText.extractTextFromXLS2007(fileBean.getUrl());
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            } else if (suffix.equalsIgnoreCase("pdf")) {
                    word = new ExtractText().readPDF(fileBean.getUrl());
            }
        }
        return word ;
    }

    private void transforms(MultipartFile file, FileBean fileBean) {
        String suffix = fileBean.getFname().substring(fileBean.getFname().lastIndexOf(".")+1);
        logger.info("===================================trasforms, suffix{[]}", suffix);
        String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
        if(PropertiesStr.office.contains(suffix)){
            String outputPath = path + "transfroms\\" + DateUtil.currentDate("yyyy-MM-dd");
            //Converter con = new Converter(fileBean.getUrl());
            Converter converter = new Converter(fileBean.getUrl());
            converter.setFirst(outputPath);
            converter.setSecond(fileBean.getFname().substring(0, fileBean.getFname().lastIndexOf("."))+System.currentTimeMillis()+".swf");
            converter.conver();
            fileBean.setUrlTransforms(converter.getswfPath());
            fileBean.setUrlImage("");
        }else if(PropertiesStr.music.contains(suffix)){
            fileBean.setUrlTransforms(fileBean.getUrl());
            fileBean.setUrlImage("");
        }else if(PropertiesStr.video.contains(suffix)){
            ConvertVideo convertVideo = new ConvertVideo(fileBean.getUrl());
            ConvertVideo.processImg(fileBean.getUrl(), fileBean.getUrl(), 10);
            //缩略图
            try {
                Thread.sleep(1000);
                File destFile = new File(path + "transfroms\\image\\" + DateUtil.currentDate("yyyy-MM-dd"), fileBean.getFname()+".jpg");
                String jpgPath = fileBean.getUrl() + ".jpg";
                FileUtils.copyFile(new File(jpgPath) , destFile);
                fileBean.setUrlImage("\\knowledge\\" + "transfroms\\image\\" + DateUtil.currentDate("yyyy-MM-dd") + "\\" + fileBean.getFname()+".jpg");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }catch (IOException e) {
                e.printStackTrace();
            }
            //转换
            convertVideo.convert(fileBean.getUrl(),
                    fileBean.getUrl().substring(0, fileBean.getUrl().lastIndexOf("."))+".flv");


            fileBean.setUrlTransforms(fileBean.getUrl().substring(0, fileBean.getUrl().lastIndexOf("."))+".flv");
        }else if (PropertiesStr.image.contains(suffix)){
            fileBean.setUrlTransforms(fileBean.getUrl());
            fileBean.setUrlImage(fileBean.getUrl());
        }

    }


    public void useraddFile(FileBean fileBean, MultipartFile file, Map<String, Object> map) {
        if (file != null) {
            String filename = file.getOriginalFilename();
            fileBean.setFname(filename);
            String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
            filename = String.valueOf(System.currentTimeMillis()) + filename;
            path = path + "upload";
            File upload = new File(path, filename);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), upload);
            } catch (IOException e) {
                e.printStackTrace();
            }

            String url = path + "\\" + filename;
            fileBean.setUrl(url);
            fileBean.setUuidname(filename);
            if (fileBean.getCanTransforms() == 0) {
                transforms(file, fileBean);
            } else {
                fileBean.setUrlImage("");
                fileBean.setUrlTransforms("");
            }

        } else {
            fileBean.setUrlImage("");
            fileBean.setUrlTransforms("");
            fileBean.setUrl("");
            fileBean.setUuidname("");
            fileBean.setFname("");
        }

        //tags
        String tags = fileBean.getTags();
        StringBuffer sb = new StringBuffer();
        boolean flag = false;
        for (String tag : tags.split(",")) {
            if (flag == false) {
                sb.append(tag);
                flag = true;
            } else {
                sb.append(CommonConst.SPLITOR);
                sb.append(tag);
            }
        }
        fileBean.setTags(sb.toString());
        reviewDao.insertSelective(fileBean);

//        String other = extract(fileBean);
//        ESFileBean esFileBean = new ESFileBean(fileBean);
//        esFileBean.setOther(other);
//        CElastic.inital();
//        CElastic.elastic.insert(esFileBean);
    }

    public void delfile(int id) {
        fileDao.deleteByPrimaryKey(id);
        CElastic.inital();
        CElastic.elastic.delete(id);
    }

    public void delreview(int id) {
        reviewDao.deleteByPrimaryKey(id);
    }
}
