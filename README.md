Find removed line is really useful.Because git blame can check who added this line, but there is no command to check who delete one line.

find_removed_line.sh can provide which commit deleted specific code content.

Usage of find_removed_line.sh:

  cd $your_git_folder
  
  ./${path}/find_removed_line.sh "$removed_string"
  
For example:

  cd vendor/mmm/aaa/
  
  ~/git_tools/find_removed_line.sh "Add zzz related change"
  
The output is:

          The line Add zzz related change is removed in commit: 1fa9bebd8b362c0afbb2186e3fe6ef085d8c0762
   
          commit 1fa9bebd8b362c0afbb2186e3fe6ef085d8c0762
   
          Author: xxx <xxx@mmm.com>
   
          Date:   Fri Dec 12 20:20:09 2014 +0800

              SDK: aaa: Add zzz function in aaa
          
              Change-Id: I0df77e6b84585f828833808d06482fb5fb523892
              Reviewed-on: http://debugerrit.mmm.com:8080/42126
              Tested-by: Jenkins MMM <jenkins.mmm@gmail.com>
              Tested-by: Fengyi Zhao <zhaofy@mmm.com>
              Reviewed-by: Fengyi Zhao <zhaofy@mmm.com>
   