function plot_snapshots()
k = 1;
t = [1 10 20];

for i=1:length(t)
    plot_snapshot(t(i),k);
end

disp('done!')
