%% PWA Output Formatting
% Convert PWA Regions into 2D Arrays to Assist in BST Implementation

fid_o = fopen('PWA_Solution.txt', 'w');
temp_array = size(mpcobjExplicitSimplified.PiecewiseAffineSolution);
num_regions = temp_array(2);

% Deal with F Matrix
fprintf(fid_o, 'PWA_F: ARRAY [0..%d] OF REAL := [', num_regions - 1);
for i = 1:num_regions
    temp_array = size(mpcobjExplicitSimplified.PiecewiseAffineSolution(i).F);
    num_elements = temp_array(2);
    num_rows = temp_array(1);
    fprintf(fid_o, '(');
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
        fprintf(fid_o, '),\n\t');
    else
        fprintf(fid_o, ')');
    end
end
fprintf(fid_o, ']\n');

% Deal with G Matrix
fprintf(fid_o, 'PWA_G: ARRAY [0..%d] OF REAL := [', num_regions - 1);
for i = 1:num_regions
    temp_array = size(mpcobjExplicitSimplified.PiecewiseAffineSolution(i).G);
    num_elements = temp_array(2);
    num_rows = temp_array(1);
    fprintf(fid_o, '(');
    for j = 1:num_rows
        for k = 1:num_elements
            if (k == num_elements && j == num_rows)
                fprintf(fid_o, '%1.6f', mpcobjExplicitSimplified.PiecewiseAffineSolution(i).G(j, k));
            else
                fprintf(fid_o, '%1.6f,', mpcobjExplicitSimplified.PiecewiseAffineSolution(i).G(j, k));
            end
        end
    end
    if (i ~= num_regions)
        fprintf(fid_o, '),\n\t');
    else
        fprintf(fid_o, ')');
    end
end
fprintf(fid_o, ']\n');

% Deal with H Matrix
fprintf(fid_o, 'PWA_H: ARRAY [0..%d] OF REAL := [', num_regions - 1);
for i = 1:num_regions
    temp_array = size(mpcobjExplicitSimplified.PiecewiseAffineSolution(i).H);
    num_elements = temp_array(2);
    num_rows = temp_array(1);
    fprintf(fid_o, '(');
    for j = 1:num_rows
        for k = 1:num_elements
            if (k == num_elements && j == num_rows)
                fprintf(fid_o, '%1.6f', mpcobjExplicitSimplified.PiecewiseAffineSolution(i).H(j, k));
            else
                fprintf(fid_o, '%1.6f,', mpcobjExplicitSimplified.PiecewiseAffineSolution(i).H(j, k));
            end
        end
    end
    if (i ~= num_regions)
        fprintf(fid_o, '),\n\t');
    else
        fprintf(fid_o, ')');
    end
end
fprintf(fid_o, ']\n');

% Deal with K Matrix
fprintf(fid_o, 'PWA_K: ARRAY [0..%d] OF REAL := [', num_regions - 1);
for i = 1:num_regions
    temp_array = size(mpcobjExplicitSimplified.PiecewiseAffineSolution(i).K);
    num_elements = temp_array(2);
    num_rows = temp_array(1);
    fprintf(fid_o, '(');
    for j = 1:num_rows
        for k = 1:num_elements
            if (k == num_elements && j == num_rows)
                fprintf(fid_o, '%1.6f', mpcobjExplicitSimplified.PiecewiseAffineSolution(i).K(j, k));
            else
                fprintf(fid_o, '%1.6f,', mpcobjExplicitSimplified.PiecewiseAffineSolution(i).K(j, k));
            end
        end
    end
    if (i ~= num_regions)
        fprintf(fid_o, '),\n\t');
    else
        fprintf(fid_o, ')');
    end
end
fprintf(fid_o, ']\n');
