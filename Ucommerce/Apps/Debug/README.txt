In the debug folder you'll find examples of ways to use 'partial components' to enable debugging. 

'Enable-Debug-On-Basket-Pipeline.config.example' Will patch the property called Debug on the basket pipeline, by setting the value to True. 
This will enable logging of the basket pipeline, writing out execution time of each task in the log file. patching the debug parameter can be enabled for all pipelines in Ucommerce.

'Write-Config-To-File.config.example' Will enable writing out the full structure of the final configuration file, after everything has been patched and replaced. Find the full configuration file under:
'~/App_Data/TEMP/Ucommerce.config'

'Enable-Timing-On-ScratchIndexer' Will enable a timing interceptor on the component, that will meassure the execution time on any given method called. This can be enabled for all registered components in the container including your own components.

To enable either of the standard debugging facilities, simply remove the '.example' extension on the files, and they will be picked up during application start.