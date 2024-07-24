@echo off

REM This script can be used to set up AOAME locally.
REM Prerequisites: git ( https://git-scm.com/downloads ), Node.js ( https://nodejs.org )

REM ----------------------------------

REM Change these variables if you want to use a branch other than the master branch.
set webapp_branch=master
set webservice_branch=master
set fuseki_branch=master

REM --------------It is not recommended to change things below this line.---------------------

echo AOAME local setup script started.

set base_dir=%cd%\aoame

mkdir aoame

rem check if commands exist

where git
if %ERRORLEVEL% neq 0 (
	echo Git is required for this script to work. You can download it from https://git-scm.com/downloads
	pause
	goto end
)

where node
if %ERRORLEVEL% neq 0 (
	echo The webapp requires Node.js for it to work. You can download it from https://nodejs.org/en/
	pause
	goto end
)

where npm
if %ERRORLEVEL% neq 0 (
	echo The webapp requires npm for it to work. Make sure to also install npm while installing node.js from https://nodejs.org/en/
	pause
	goto end
)

:check_angular
where ng
if %ERRORLEVEL% neq 0 (
	echo Installing Angular...
	npm install -g @angular/cli
	if %ERRORLEVEL% neq 0 (
		echo Failed to install Angular CLI
		pause
		goto end
	)
)
goto check_repos

:check_repos
rem clone and deploy fuseki
set git_name=fuseki-heroku-test
set git_repository=https://github.com/BPaaSModelling/fuseki-heroku-test.git
set branch=%fuseki_branch%
call :clone_repository

rem clone and deploy webservice
set git_name=OntologyBasedModellingEnvironment-WebService
set git_repository=https://github.com/BPaaSModelling/OntologyBasedModellingEnvironment-WebService.git
set branch=%webservice_branch%
call :clone_repository

rem clone and deploy webapp
set git_name=OntologyBasedModellingEnvironment-WebApp
set git_repository=https://github.com/BPaaSModelling/OntologyBasedModellingEnvironment-WebApp.git
set branch=%webapp_branch%
call :clone_repository

call :setup_webapp

pause
goto end

rem Clone a repository if it does not exist already.
:clone_repository
cd %base_dir%
if not exist %git_name% (
	echo Cloning %git_name% repository from %git_repository%
	git clone %git_repository% -b %branch%
	if %ERRORLEVEL% neq 0 (
		echo Failed to clone repository %git_name% from %git_repository%
		pause
		goto end
	)
)
exit /b 0

:setup_webapp
cd %base_dir%\OntologyBasedModellingEnvironment-WebApp
npm install --legacy-peer-deps
if %ERRORLEVEL% neq 0 (
	echo Failed to install npm packages for the webapp
	pause
	goto end
)
ng build
if %ERRORLEVEL% neq 0 (
	echo Failed to build the webapp
	pause
	goto end
)
exit /b 0

:end
echo AOAME local setup script completed.
