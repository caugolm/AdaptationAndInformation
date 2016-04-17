function p = projectPoisson(rateVector, binSize)
% function returns a binary vector to represent a spike train. Each element
% in the vector is to represent one time bin (or time step), either 
% specified upon input or somewhat arbitrarily set to 1 ms
% Assumes everything in units of seconds and Hz


% if there's only one input, assume it's the vector of rates coming out of 
% non-linear function, and set the bin size to 1 ms
if nargin() == 1 ;
    binSize = .001 ;
    sprintf('Setting bin size to 1 ms')
end
% total number of timepoints to consider
timeTotal = length(rateVector) ; 
% make random vector of values between 0 and 1
randVector = rand(timeTotal, 1) ; 

% create empty spike tran vector
spikeTrain = zeros(floor(rateVector), 1) ;

% for each time point in the rate vector, check to see if it's greater than
% the relevant random number. If yes, then say there's a spike at that time
% and set the entry to 1. If not, set it to 0 (so do nothing because it's 
% initialized to 0)

for i = 1:timeTotal
    probFire = rateVector(i) * binSize ;
    if probFire > randVector(i)
        spikeTrain(i) = 1 ;
    else
        % spikeTrain for that step stays 0
    end
end

% can check the spike train
%plot(spikeTrain)

p = spikeTrain ;
end
