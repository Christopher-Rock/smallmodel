function data=pulltable(intdir)

    tresults=getresults(intdir);
    cresults=getresults([upfolder(intdir) 'BaselineInt']);
    data=tresults.incall(end)/cresults.incall(end);
    

end
    
    
function results=getresults(intdir)
    if intdir(end)~='/'&& intdir(end)~='\'
        intdir=[intdir '/'];
    end
    load([intdir 'Results/PngHIVIntervene1'],'HIVIntResults1')
    load([intdir 'input/PNGintPrepared'],'ModelintSpecs','labels')
    timesteps=ModelintSpecs.intsteps;
    steps_year=ModelintSpecs.steps_year;
    results=getPNGresults(HIVIntResults1,timesteps,steps_year,labels);
    
    
end
function parent=upfolder(child,levels)
%    UPFOLDER       Returns a string containing the parent of the path
%                   name in child
% child       String containing path name
% level       Number of directories to go up
if(nargin==1), levels=1; end
slashes=find(child=='\'|child=='/');
nofinalslash=child(end)~='\'&child(end)~='/';
parent=child(1:slashes(end-levels+nofinalslash));
end
