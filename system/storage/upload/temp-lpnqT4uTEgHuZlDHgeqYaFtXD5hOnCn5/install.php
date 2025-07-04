<?php
$sql = "SHOW TABLES LIKE '" . DB_PREFIX . "product'";
if (count($this->db->query($sql)->rows) > 0) { // if table exists
    $show_column_video_sql = "SELECT `video` FROM FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA` = '" . DB_DATABASE . "' AND `TABLE_NAME` = '" . DB_PREFIX . "product' AND `COLUMN_NAME` = 'video'";
    $show_column_video = $this->db->query($show_column_video_sql)->rows;
    if (count($show_column_video) == 0) { // if column does not exist
        $sql = "ALTER TABLE `" . DB_PREFIX . "product` ADD `video_link` TEXT NOT NULL DEFAULT '' AFTER `image`";
        $this->db->query($sql);
    }
}
