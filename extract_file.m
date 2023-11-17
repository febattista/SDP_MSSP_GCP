function extract_file(zipFile, inputFile, outputFile, splitted)
%EXTRACT_FILE Summary of this function goes here
%   Detailed explanation goes here
    if (splitted)
        num_pieces = 5;
        for i=1:num_pieces
            piece = [inputFile(1:end-4), sprintf('_%d', i), inputFile(end-3:end)];
            out_piece = [outputFile(1:end-4), sprintf('_%d', i), outputFile(end-3:end)];
            entry = zipFile.getEntry(piece); % empty if not found
            if(~isempty(entry))
                inputstream = zipFile.getInputStream(entry);
                outJavaFile = java.io.File(out_piece);
                outStream = java.io.FileOutputStream(outJavaFile);
                copier = com.mathworks.mlwidgets.io.InterruptibleStreamCopier.getInterruptibleStreamCopier;
                copier.copyStream(inputstream, outStream);
                outStream.close();
            end
        end
    else 
        entry = zipFile.getEntry(inputFile); % empty if not found
        if(~isempty(entry))
            inputstream = zipFile.getInputStream(entry);
            outJavaFile = java.io.File(outputFile);
            outStream = java.io.FileOutputStream(outJavaFile);
            copier = com.mathworks.mlwidgets.io.InterruptibleStreamCopier.getInterruptibleStreamCopier;
            copier.copyStream(inputstream, outStream);
            outStream.close();
        end
    end
end
