classdef GUI_awal_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        HOME                       matlab.ui.Figure
        Panel                      matlab.ui.container.Panel
        ESTIMASIMODELSUDUTGERAKSIKUDENGANMETODELabel  matlab.ui.control.Label
        Image                      matlab.ui.control.Image
        NONLINEARAUTOREGRESSIVEWITHEXOGENEOUSLabel  matlab.ui.control.Label
        INPUTNARXLabel             matlab.ui.control.Label
        MOHAMMADYUSUFZAMZAMILabel  matlab.ui.control.Label
        MENUDropDownLabel          matlab.ui.control.Label
        PILIH                      matlab.ui.control.DropDown
    end

    
    properties (Access = private)
        Property % Description
        data_awal = imread("universitas-airlangga-surabaya.png");
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
%            imshow(app.data_awal,'Parent',app.UIAxes);
        end

        % Value changed function: PILIH
        function PILIHValueChanged(app, event)
            value = app.PILIH.Value;
            if value == 'APLIKASI'
                uigetfile;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create HOME and hide until all components are created
            app.HOME = uifigure('Visible', 'off');
            app.HOME.Position = [100 100 640 480];
            app.HOME.Name = 'HOME';

            % Create Panel
            app.Panel = uipanel(app.HOME);
            app.Panel.Position = [1 1 640 480];

            % Create ESTIMASIMODELSUDUTGERAKSIKUDENGANMETODELabel
            app.ESTIMASIMODELSUDUTGERAKSIKUDENGANMETODELabel = uilabel(app.Panel);
            app.ESTIMASIMODELSUDUTGERAKSIKUDENGANMETODELabel.FontName = 'Times New Roman';
            app.ESTIMASIMODELSUDUTGERAKSIKUDENGANMETODELabel.FontSize = 14;
            app.ESTIMASIMODELSUDUTGERAKSIKUDENGANMETODELabel.FontWeight = 'bold';
            app.ESTIMASIMODELSUDUTGERAKSIKUDENGANMETODELabel.Position = [114 409 411 22];
            app.ESTIMASIMODELSUDUTGERAKSIKUDENGANMETODELabel.Text = 'ESTIMASI MODEL SUDUT GERAK SIKU DENGAN METODE';

            % Create Image
            app.Image = uiimage(app.Panel);
            app.Image.Position = [132 99 376 282];
            app.Image.ImageSource = 'awal.png';

            % Create NONLINEARAUTOREGRESSIVEWITHEXOGENEOUSLabel
            app.NONLINEARAUTOREGRESSIVEWITHEXOGENEOUSLabel = uilabel(app.Panel);
            app.NONLINEARAUTOREGRESSIVEWITHEXOGENEOUSLabel.FontName = 'Times New Roman';
            app.NONLINEARAUTOREGRESSIVEWITHEXOGENEOUSLabel.FontSize = 14;
            app.NONLINEARAUTOREGRESSIVEWITHEXOGENEOUSLabel.FontWeight = 'bold';
            app.NONLINEARAUTOREGRESSIVEWITHEXOGENEOUSLabel.FontAngle = 'italic';
            app.NONLINEARAUTOREGRESSIVEWITHEXOGENEOUSLabel.Position = [129 388 371 22];
            app.NONLINEARAUTOREGRESSIVEWITHEXOGENEOUSLabel.Text = 'NON-LINEAR AUTO REGRESSIVE WITH EXOGENEOUS';

            % Create INPUTNARXLabel
            app.INPUTNARXLabel = uilabel(app.Panel);
            app.INPUTNARXLabel.FontName = 'Times New Roman';
            app.INPUTNARXLabel.FontSize = 14;
            app.INPUTNARXLabel.FontWeight = 'bold';
            app.INPUTNARXLabel.FontAngle = 'italic';
            app.INPUTNARXLabel.Position = [270 367 99 22];
            app.INPUTNARXLabel.Text = 'INPUT (NARX)';

            % Create MOHAMMADYUSUFZAMZAMILabel
            app.MOHAMMADYUSUFZAMZAMILabel = uilabel(app.Panel);
            app.MOHAMMADYUSUFZAMZAMILabel.FontName = 'Times New Roman';
            app.MOHAMMADYUSUFZAMZAMILabel.FontSize = 14;
            app.MOHAMMADYUSUFZAMZAMILabel.FontWeight = 'bold';
            app.MOHAMMADYUSUFZAMZAMILabel.Position = [208 78 224 22];
            app.MOHAMMADYUSUFZAMZAMILabel.Text = 'MOHAMMAD YUSUF ZAMZAMI';

            % Create MENUDropDownLabel
            app.MENUDropDownLabel = uilabel(app.Panel);
            app.MENUDropDownLabel.HorizontalAlignment = 'right';
            app.MENUDropDownLabel.Position = [6 7 41 22];
            app.MENUDropDownLabel.Text = 'MENU';

            % Create PILIH
            app.PILIH = uidropdown(app.Panel);
            app.PILIH.Items = {'HOME', 'APLIKASI', 'Option 3', 'Option 4'};
            app.PILIH.ValueChangedFcn = createCallbackFcn(app, @PILIHValueChanged, true);
            app.PILIH.Position = [62 7 100 22];
            app.PILIH.Value = 'HOME';

            % Show the figure after all components are created
            app.HOME.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = GUI_awal_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.HOME)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.HOME)
        end
    end
end