<?php
namespace app\index\controller;

use app\common\controller\HomeBase;
use app\common\model\Category as CategoryModel;
use app\common\model\Article as ArticleModel;
use think\Db;

class Index extends HomeBase
{
    public function index($page = 1){

        $articleModel=new ArticleModel();
    	$lists = $articleModel->order('is_top,sort,publish_time DESC')->paginate(10);

        //热门点击
        $map1['status']  = 1;
        $map1['is_recommend']  = 1;
        $reading=Db::name('article')->where($map1)->order('sort DESC')->limit(6) ->select();  
		return $this->fetch('index',['lists' => $lists,'reading'=>$this->reading(),]);
    }

    public function lists($cid=1,$page=0){
        $map   = array();		
        $category_model = new CategoryModel();
        $category_children_ids = $category_model->where(['path' => ['like', "%,{$cid},%"]])->column('id');
        $category_children_ids = (!empty($category_children_ids) && is_array($category_children_ids)) ? implode(',', $category_children_ids) . ',' . $cid : $cid;
        $map['cid']            = ['IN', $category_children_ids];
        $articleModel=new ArticleModel();
    	$lists = $articleModel->where($map)->order('is_top,sort,publish_time DESC')->paginate(10);

        $category= CategoryModel::get($cid);
        if ($category['pid'] == 0) {
            $category_list= $category_model->where(['pid' => $cid])->select();
            $child_cid=0;
        }else{
            $category_list= $category_model->where(['pid' => $category['pid']])->select();
            $child_cid=$cid;
            $cid=$category['pid'];
        }	

		return $this->fetch('lists',['lists' => $lists,'current_nav'=>'/lists/'.$cid,'category'=>$category,'category_list'=>$category_list,'child_cid'=>$child_cid,'reading'=>$this->reading(),]);
    }
    
    public function search($cid=1, $page = 1){

    }
    /**
     * 文章页  
     */
    public function article($aid){
    	$article = ArticleModel::get(['status' => 1,'id'=>$aid]);
    	if ($article) {
            $article->reading=($article->reading+rand(1,9));
    		$article->save();
    	}
		$category= CategoryModel::get($article['cid']);
		$title=$category['name'];
        $reading=$this->reading();
		return $this->fetch('article',['article' => $article,'cid'=>$article['cid'],'current_nav'=>'/lists/'.$article['cid'],'title'=>$title,'reading'=>$reading]);
    }

    /*
    * 热门点击
    */
    private function reading(){
        $map['status']  = 1;
        //$map['is_recommend']  = 1;
        //$map1['label']  = ['like','%2%'];
        $list=Db::name('article')->where($map)->order('sort,reading DESC ')->limit(6) ->select();  
        return $list;
    }

}
