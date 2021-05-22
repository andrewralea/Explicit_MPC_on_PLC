%% PWA Output Formatting
% Convert PWA Regions into 2D Arrays to Assist in BST Implementation

fid_o = fopen('PWA_Solution.txt', 'w');
temp_array = size(mpcobjExplicitSimplified.PiecewiseAffineSolution);
num_regions = temp_array(2);

% Deal with F Matrix
temp_array = size(mpcobjExplicitSimplified.PiecewiseAffineSolution(1).F);
num_elements = temp_array(2);
fprintf(fid_o, 'PWA_F: ARRAY [1..%d] OF ARRAY [1..%d] OF REAL := [', num_regions, num_elements);
for i = 1:num_regions
    temp_array = size(mpcobjExplicitSimplified.PiecewiseAffineSolution(i).F);
    num_elements = temp_array(2);
    num_rows = temp_array(1);
    fprintf(fid_o, '[');
    for j = 1:num_rows
        for k = 1:num_elements
            if (k == num_elements && j == num_rows)
                fprintf(fid_o, '%1.6f', mpcobjExplicitSimplified.PiecewiseAffineSolution(i).F(j, k));
            else
                fprintf(fid_o, '%1.6f,', mpcobjExplicitSimplified.PiecewiseAffineSolution(i).F(j, k));
            end
        end
    end
    if (i ~= num_regions)
        fprintf(fid_o, '],\n\t');
    else
        fprintf(fid_o, ']');
    end
end
fprintf(fid_o, '];\n');

