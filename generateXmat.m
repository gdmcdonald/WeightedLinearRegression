function Xmat=generateXmat(x,varargin)

nVarargs=length(varargin);
nDatapoints=length(x);

Xmat=zeros(nDatapoints,nVarargs);

for k = 1:nVarargs
    thisVar=eval(varargin{k});
    if length(thisVar)==1
        Xmat(:,k)=x.*0+thisVar;
    else
        Xmat(:,k)=thisVar;
    end
end

end