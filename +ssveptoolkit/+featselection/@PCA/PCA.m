classdef PCA < ssveptoolkit.featselection.FeatureSelectionBase
    properties (Access = public)
        componentNum;
    end
    methods
        function PCA = PCA(instanceSet,componentNum)
            if nargin == 0
                PCA.componentNum = 50;
            else
                PCA.componentNum = componentNum;
                PCA.originalInstanceSet = instanceSet;
            end
        end
        
        function PCA = compute(PCA)
            ins = PCA.originalInstanceSet.getInstances;
            [~,score,~,~,~] = pca(ins,'NumComponents',PCA.componentNum);
            PCA.filteredInstanceSet = ssveptoolkit.util.InstanceSet(score,PCA.originalInstanceSet.getLabels);
        end
        function configInfo = getConfigInfo(PCA)
            configInfo = sprintf('PCA\tcomponents:%d', PCA.componentNum);
        end
        
        function time = getTime(PCA)
            time = 0;
        end
    end
end