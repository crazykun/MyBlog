<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Db;

/**
 * 后台首页
 * Class Index
 * @package app\admin\controller
 */
class Index extends AdminBase
{
    protected function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 首页
     * @return mixed
     */
    public function index()
    {
        $version = Db::query('SELECT VERSION() AS ver');
        $config  = [
            'url'             => $_SERVER['HTTP_HOST'],
            'document_root'   => $_SERVER['DOCUMENT_ROOT'],
            'server_os'       => PHP_OS,
            'server_port'     => $_SERVER['SERVER_PORT'],
            'server_soft'     => $_SERVER['SERVER_SOFTWARE'],
            'php_version'     => PHP_VERSION,
            'mysql_version'   => $version[0]['ver'],
            'max_upload_size' => ini_get('upload_max_filesize')
        ];

        //蜘蛛访问
		$spider=Db::name('spider')->order('id desc')->limit(8)->select();
        return $this->fetch('index', ['config' => $config,'spider'=>$spider,'visitor'=>$this->getVisitor()]);
    }
    
    /**
     * 生成访问量数据
     * @param int $num 数量
     * @param int $type 类型
     * @return array 信息
     */
    public function getVisitor($num=7){
        $visitorList=Db::name('visitor')->order('id desc')->limit($num)->select();
        $visitorList=array_reverse($visitorList);
        if($visitorList){
            foreach($visitorList as $v){
                $label[]=date('m-d',$v['time']);
                $count[]=$v['count'];
            }
            $data['label']=json_encode($label);
            $data['count']=json_encode($count);
        }else{
            $data=['label'=>'','count'=>''];
        }
        return $data;
        
    }
}