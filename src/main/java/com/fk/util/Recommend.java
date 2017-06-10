package com.fk.util;

/**
 * Created by FK on 2017/6/10.
 */

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Recommend {
    public List<Integer> getID(int uid) throws IOException, TasteException {
        DataModel dataModel = 	new FileDataModel(new File("D:\\upload\\intro.csv"));
        UserSimilarity userSimilarity = RecommendFactory.userSimilarity(RecommendFactory.SIMILARITY.EUCLIDEAN, dataModel);
        UserNeighborhood userNeighborhood = RecommendFactory.userNeighborhood(RecommendFactory.NEIGHBORHOOD.NEAREST, userSimilarity, dataModel, 2);
        RecommenderBuilder recommenderBuilder = RecommendFactory.userRecommender(userSimilarity, userNeighborhood, true);

        RecommendFactory.evaluate(RecommendFactory.EVALUATOR.AVERAGE_ABSOLUTE_DIFFERENCE, recommenderBuilder, null, dataModel, 0.7);
        RecommendFactory.statsEvaluator(recommenderBuilder, null, dataModel, 2);
        List<Integer> id = new ArrayList<Integer>();
        List<RecommendedItem> list = recommenderBuilder.buildRecommender(dataModel).recommend(uid, 6);
        for(RecommendedItem r : list){
            id.add((int)r.getItemID());
            System.out.println("id"+r.getItemID());
        }
        return id;
    }
}
