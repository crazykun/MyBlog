<?php

use think\migration\Migrator;
use think\migration\db\Column;

class CreateArticle extends Migrator
{
    protected  $tableName='article';

	public function up()
	{
        if($this->hasTable($this->tableName)){
            $this->dropTable($this->tableName);
        }
        $table  = $this->table($this->tableName, array('id' => false, 'primary_key' =>'id','engine'=>'MyISAM','comment'=>'文章表'));
        $table ->addColumn('id', 'integer', array('limit' => 20,'comment'=>'文章ID'))
            ->addColumn('cid', 'integer', array('limit' => 5,'comment'=>'分类ID'))
            ->addColumn('title', 'string', array('limit' => 255,'comment'=>'标题','default'=>''))
            ->addColumn('introduction', 'string', array('limit' => 255,'null'=>true,'comment'=>'简介','default'=>''))
            ->addColumn('content', 'text', array('comment'=>'内容','default'=>'','null'=>true))
            ->addColumn('author', 'string', array('limit' => 20,'comment'=>'作者','default'=>'','null'=>true))
            ->addColumn('status', 'integer', array('limit' => 1,'comment'=>'状态 0 待审核  1 审核','default'=>'0'))
            ->addColumn('reading', 'integer', array('limit' => 10,'comment'=>'阅读量','default'=>'0'))
            ->addColumn('thumb', 'string', array('limit' => 255,'comment'=>'缩略图','default'=>''))
            ->addColumn('photo', 'text', array('comment'=>'图集','default'=>'','null'=>true))
            ->addColumn('is_top', 'integer', array('limit' => 1,'comment'=>'是否置顶  0 不置顶  1 置顶','default'=>'0'))           
            ->addColumn('sort', 'integer', array('limit' => 3,'comment'=>'排序','default'=>'0'))
            ->addColumn('create_time', 'datetime', array('comment'=>'创建时间'))
            ->addColumn('publish_time', 'datetime', array('comment'=>'发布时间'))
            ->addColumn('delete_time', 'datetime', array('comment'=>'删除时间'))
            ->save();

        $rows=[
            ['id'=>1,'cid'=>1,'title'=>'测试','introduction'=>'测试','content'=>'测试content','author'=>'admin','status'=>1,'reading'=>99,'photo'=>'a:2:{i:0;s:54:\"/uploads/20161230/1a8156e5f7d7ae69b6fd53fd0208509a.jpg\";i:1;s:54:\"/uploads/20161230/0c55fed359e476c84e1188cc22754ae0.png\";}','create_time'=>date('Y-m-d H:i:s'),'publish_time'=>date('Y-m-d H:i:s')],
        ];
        $this->insert($this->tableName, $rows);
	}
}
