/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Akshay
 */
public class Posts {
    private String postId;
    private String userPosts;

    public Posts(String postId,String userPosts){
        this.postId = postId;
        this.userPosts = userPosts;
    }
    
    
    /**
     * @return the postID
     */
    public String getPostId() {
        return postId;
    }

    /**
     * @param postID the postID to set
     */
    public void setPostId(String postId) {
        this.postId = postId;
    }

    /**
     * @return the userPosts
     */
    public String getUserPosts() {
        return userPosts;
    }

    /**
     * @param userPosts the userPosts to set
     */
    public void setUserPosts(String userPosts) {
        this.userPosts = userPosts;
    }


}
