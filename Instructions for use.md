# Instructions for use

slightContrat is an integrated automated framework that combines intelligent contract vulnerability detection and repair. It is built as a Maven project using Java JDK 1.8.



## The steps for using 

1. Wait for the project dependencies to be resolved and installed.

2. Enter the relevant path configuration information in the config.properties file in the project directory.

   ```java
   rootPath = your project path    
   contractsPath = contracts file
   ```

   

The **rootPat**h is the root directory of the current project, such as "D:\DectionContract\SolidityDetection_fix\\", and it is important to include the final backslash.

The **contractsPath** is the directory where the contracts are stored, such as "D:\DectionContract\SolidityDetection_fix\test\\", and similarly, the final backslash must be included.

By default, the **test folder** in the root directory of the project is used for storing contracts. It is recommended to use this folder directly for contract storage and not change it to another location.

Please note that the default test folder of the project contains relevant **test datasets** (under the \test\contracts\dataset directory) and **simple test cases** (\test\contracts\simpleTest).

3.The **prettier-plugin-solidity** code formatting tool needs to be installed in the contractsPath directory.

   Run the following installation command in the command line under the contractsPath directory:

```javascript
npm install --save-dev prettier prettier-plugin-solidity

```

After installation, the   **.prettierignore** file   and   **.prettierrc.js**   in the original contractsPath directory are the configuration files for **prettier**. If you are using the **default test folder** for storing contracts, there is no need to modify them. If you have changed to another location, please copy the contents of these configuration files to the new location.

4.The project **startup** options are located in **\src\my.smartdec.detect\app\cli\DectionOne**. Configure the startup options with the following command:

```
-p <contract path> -r XPath/solidity-rules.xml
```

![image-20240102194709064](C:\Users\paine\AppData\Roaming\Typora\typora-user-images\image-20240102194709064.png)

<contract path> is the path to the contract under contractsPath, for example, "-p test/simpleTest.sol"

The file after -r is the location of the XPath rules library, which by default does not need to be modified.

5.After completing the configuration as described above, you can start the project. The repaired contract will be appended with 'fixed' and written into the contractsPath directory, for example, simpleTestfixed.sol.

## Usage Example

1. Write the contract to be detected into the simpleTest.sol file in the test directory.

   ![image-20240102195013374](C:\Users\paine\AppData\Roaming\Typora\typora-user-images\image-20240102195013374.png)

2. Run the DectionOne project.

   ![image-20240102195057714](C:\Users\paine\AppData\Roaming\Typora\typora-user-images\image-20240102195057714.png)

3. The console will output relevant detection information, and the repaired contract will be written into the test directory.

## Precautions:

1. Please ensure that there is no content in the output contract file(such as simpleTestfixed.sol)  before running the program, as this may lead to conflicts when the repaired contract is written into the file.