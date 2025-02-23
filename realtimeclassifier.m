% Load trained classifier
loadedModel = load('absence_seizure_classifier.mat');
model = loadedModel.model;

% Load new EOG data (replace 'new_data.mat' with your actual file)
newData = load(xxx);  

% Assuming your data is stored in a variable like 'eog_signals'
if isfield(newData, 'eog_signals')
    dataMatrix = newData.eog_signals;  % Extract data
else
    error('Variable "eog_signals" not found in the .mat file.');
end

% Ensure data format matches the classifier input
if size(dataMatrix, 2) < 3
    error('Insufficient features in data. Expected at least 3 columns.');
end

% Predict using the trained model
predicted_labels = predict(model, dataMatrix(:, [1, 2, 3])); % Adjust indices if needed

% Display results
disp('Predictions:');
disp(predicted_labels);n