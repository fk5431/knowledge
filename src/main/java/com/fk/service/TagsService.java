package com.fk.service;

import com.fk.bean.TagsBean;
import com.fk.dao.TagsDao;
import com.fk.util.CommonConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by FK on 2017/5/19.
 */
@Service("tagsService")
public class TagsService {

    @Autowired
    TagsDao tagsDao;

    private final int SIZE = 8;
    public void addUserTags(int uid, String tags) {
        String[] tag = tags.split(CommonConst.SPLITOR);
        for(String str : tag) {
            TagsBean t = tagsDao.selectByTag(str);
            if(t == null) {
                TagsBean tagsBean = new TagsBean();
                tagsBean.setUid(uid);
                tagsBean.setTag(str);
                tagsBean.setCount(1);
                tagsDao.insertSelective(tagsBean);
            }else{
                t.setCount(t.getCount() + 1);
                tagsDao.updateByPrimaryKey(t);
            }
        }
    }

    public void centerOfUserTags(int userId, Map<String, Object> map) {
        List<TagsBean> tagsBeans = tagsDao.selectByUserId(userId);
        StringBuffer sb1 = new StringBuffer();
        StringBuffer sb2 = new StringBuffer();
        boolean flag = false;
        for(TagsBean t : tagsBeans){
            if(flag == false){
                flag = true;
                sb1.append("'"+t.getTag()+"'");
                sb2.append("'"+t.getUid()+"'");
            }else{
                sb1.append(",'"+t.getTag()+"'");
                sb2.append(",'"+t.getUid()+"'");
            }
        }
        map.put("sb1", sb1.toString());
        map.put("sb2", sb2.toString());
    }

    public void selectAllOfPage(String page_, Map<String, Object> map) {
        try {
            int count = tagsDao.count();
            int page = 1;
            if (count % SIZE == 0)
                page = count / SIZE;
            else
                page = count / SIZE + CommonConst.ONE_INT;
            map.put("count", count);
            map.put("size", SIZE);
            map.put("page", page);
            int toPage;
            if (page_ == null || "".equals(page_)) {
                toPage = 1;
            } else {
                toPage = Integer.parseInt(page_);
            }
            if (toPage > page) {
                toPage = page;
            }
            map.put("pageNow", toPage);
            int start = (toPage - 1) * SIZE;
            List<TagsBean> tagsBeans = tagsDao.selectByStart(start);
            map.put("tags", tagsBeans);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
