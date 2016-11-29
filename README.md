# CVAST Toolbox #

For all your generic tool needs. Brought to you in Docker containers for freshness. 


## LetsEncrypt ##
Currently the development of this tool is paused. 
This tool was developed to use Letsencrypt with AWS load balancers, but since the latter now provides their own certificate service for free, it is no use continuing this development. 
For the time being the code for using Letsencrypt in the regular way (outside of AWS) is encorporated in nginx_entrypoint.sh. 

https://alexgaynor.net/2016/jan/20/announcing-letsencrypt-aws/  

### Useful links ###

SQL Server in Docker:  
https://github.com/Microsoft/sql-server-samples/tree/master/samples/manage/windows-containers/mssql-server-2014-express-windows  
https://github.com/brogersyh/Dockerfiles-for-windows