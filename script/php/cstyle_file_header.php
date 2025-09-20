<?php
	/*
    *  @brief include file header
	*  @file file_header.php
	*  @date Fri Sep 19 08:08:55 CDT 2025
	*  @version 0.0.1
	*/
	?>
<?php
    if($argv[1] == '--help' || $argv[1] == '-h')
    {
        echo "\n";
        echo "header.php : @date Fri Sep 19 08:08:55 CDT 2025 : @version 0.0.1\n";
        echo "\n";
        echo "Usage:\n";
        echo "ccsk [options] <name> <date> <version>\n\n";
        exit(0);
    }
    $NAME=$argv[1];
    $DATE=$argv[2];
    $VERSION=$argv[3];
    $INFO=$argv[4]
    ?>
/**
 * @file    <?php echo "$NAME" ?>.hpp
 * @version <?php echo "$VERSION\n" ?>
 * @date    <?php echo "$DATE\n" ?>
 * @info    <?php echo "$INFO\n" ?>
 */
