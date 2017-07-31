<?php
namespace app\index\controller;

use app\common\controller\HomeBase;
use app\common\model\Category as CategoryModel;
use app\common\model\Article as ArticleModel;
use think\Db;

class Index extends HomeBase
{
    public function index($cid=1, $page = 1)
    {
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
        //热门点击
        $map1['status']  = 1;
        $map1['is_recommend']  = 1;
        $map1['label']  = ['like','%2%'];
        $listReading=Db::name('article')->where($map1)->order('sort DESC')->limit(6) ->select();  
		return $this->fetch('index',['lists' => $lists,'current_nav'=>'/lists/'.$cid,'category'=>$category,'category_list'=>$category_list,'child_cid'=>$child_cid,'reading'=>$listReading,]);
    }
    public function search($cid=1, $page = 1){

    }
}
