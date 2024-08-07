# Test Automation project

# Start environment

* Requirements
    * python
    * robotframework
    * pip
    * seleniumlibrary

1. Install Python:
    ~~~~
    https://www.python.org/downloads/
    ~~~~

2. Install pip:
    ~~~~
    https://bootstrap.pypa.io/get-pip.py
    python get-pip.py
    ~~~~

3. Install Robotframework:
    ~~~~
    https://robotframework.org/?tab=1#getting-started
    ~~~~

4. Install Robotframewrok requests:
    ~~~~
    pip install robotframework-requests
    ~~~~

5. Install Selenium Library:
    ~~~~
    pip install --upgrade robotframework-seleniumlibrary
    ~~~~

6. Install Visual Code:
    ~~~~
    https://visualstudio.microsoft.com/pt-br/downloads/
    ~~~~

**NOTE:** Download the file and paste on Environment Variable, on C:\Users\your user\AppData\Local\Programs\Python\Python312\Scripts

**Cmd commands:**
Clear terminal:

    ~~~~
    cls
    ~~~~

Verifying programs installed:

    ~~~~
    pip list
    ~~~~

Verifying programs version:

    ~~~~
    program name --version
    ~~~~

**Execution**
    ~~~~
    robot -d ./results .\api_testing_usuarios.robot 
    ~~~~

**API Link**  https://serverest.dev/
