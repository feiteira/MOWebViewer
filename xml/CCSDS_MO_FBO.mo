<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<mal:specification xmlns:mal="http://www.ccsds.org/schema/ServiceSchema" xmlns:com="http://www.ccsds.org/schema/COMSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <mal:area name="FBO_proposal" number="30" version="1">
    <mal:service comment="The file management service provides the capability to manage files within one or more file systems. It is not content aware, and manipulates files as black boxes. It allows controlling flat (i.e. without support for directories) or structured (i.e. with directory support) file systems by providing functionalities to manage files and directories.&#10;&#10;File usage is not within the scope of this service. MO services which can use files have dedicated subtypes supporting the utilization of files within their context.&#10;&#10;File transfer is not within the scope of this service, unless the file management service has access to both file systems (in which case a copy operation across file systems is effectively a file transfer). It is assumed that files can be uplinked or downlinked using a dedicated transfer layer (e.g. CFDP).&#10;" name="FileManagement" number="29" xsi:type="com:ExtendedServiceType">
      <mal:capabilitySet number="1">
        <mal:submitIP comment="This operation will create a new empty file on the remote file store.&#10;" name="createFile" number="1" supportInReplay="false">
          <mal:messages>
            <mal:submit>
              <mal:field canBeNull="true" comment="The path field contains the logical path to where the file is to be created.&#10;" name="path">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
            <mal:type area="FBO" list="true" name="FileAttribute"/>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Invalid file path or name.&#10;">
              <mal:type area="COM" list="false" name="INVALID"/>
            </mal:errorRef>
            <mal:errorRef comment="File already exists.&#10;">
              <mal:type area="COM" list="false" name="DUPLICATE"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
        <mal:submitIP comment="This operation will rename a file on the remote file store.&#10;" name="renameFile" number="2" supportInReplay="false">
          <mal:messages>
            <mal:submit>
              <mal:field canBeNull="true" comment="The path field contains the logical path to where the file to be renamed exists.&#10;" name="path">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
              <mal:field canBeNull="true" comment="The old name field contains the name of the file to be renamed.&#10;" name="oldName">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
              <mal:field canBeNull="true" comment="The new name field contains the new name for the file.&#10;" name="newName">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Invalid file path or name.&#10;">
              <mal:type area="COM" list="false" name="INVALID"/>
            </mal:errorRef>
            <mal:errorRef comment="File already exists.&#10;">
              <mal:type area="COM" list="false" name="DUPLICATE"/>
            </mal:errorRef>
            <mal:errorRef comment="Referenced file could not be found.&#10;">
              <mal:type area="MAL" list="false" name="UNKNOWN"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
        <mal:submitIP comment="This operation will delete the file from the remote file store.&#10;" name="deleteFile" number="3" supportInReplay="false">
          <mal:messages>
            <mal:submit>
              <mal:field canBeNull="true" comment="The path field contains the logical path to where the file to be deleted exists.&#10;" name="path">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Invalid file path or name.&#10;">
              <mal:type area="COM" list="false" name="INVALID"/>
            </mal:errorRef>
            <mal:errorRef comment="Referenced file could not be found.&#10;">
              <mal:type area="MAL" list="false" name="UNKNOWN"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
      </mal:capabilitySet>
      <mal:capabilitySet number="2">
        <mal:submitIP comment="This operation will create a new empty directory on the remote file store.&#10;" name="createDirectory" number="4" supportInReplay="false">
          <mal:messages>
            <mal:submit>
              <mal:field canBeNull="true" comment="The path field contains the logical path to where the directory is to be created.&#10;" name="path">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
              <mal:field canBeNull="true" comment="The name field contains the name of the new directory.&#10;" name="name">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Directory already exists.&#10;">
              <mal:type area="COM" list="false" name="DUPLICATE"/>
            </mal:errorRef>
            <mal:errorRef comment="Invalid file path or name.&#10;">
              <mal:type area="COM" list="false" name="INVALID"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
        <mal:submitIP comment="This operation will rename a directory on the remote file store.&#10;" name="renameDirectory" number="5" supportInReplay="false">
          <mal:messages>
            <mal:submit>
              <mal:field canBeNull="true" comment="The path field contains the logical path to where the directory to be renamed exists.&#10;" name="path">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
              <mal:field canBeNull="true" comment="The old name field contains the name of the directory to be renamed.&#10;" name="oldName">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
              <mal:field canBeNull="true" comment="The new name field contains the new name for the directory.&#10;" name="newName">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Directory already exists.&#10;">
              <mal:type area="COM" list="false" name="DUPLICATE"/>
            </mal:errorRef>
            <mal:errorRef comment="Invalid file path or name.&#10;">
              <mal:type area="COM" list="false" name="INVALID"/>
            </mal:errorRef>
            <mal:errorRef comment="Referenced directory could not be found.&#10;">
              <mal:type area="MAL" list="false" name="UNKNOWN"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
        <mal:submitIP comment="This operation will delete the directory and its contents from the remote file store.&#10;" name="deleteDirectory" number="6" supportInReplay="false">
          <mal:messages>
            <mal:submit>
              <mal:field canBeNull="true" comment="The path field contains the logical path to where the directory to be deleted exists.&#10;" name="path">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
              <mal:field canBeNull="true" comment="The name field contains the directory that will be deleted from the remote file store.&#10;" name="name">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Invalid directory path or name.&#10;">
              <mal:type area="COM" list="false" name="INVALID"/>
            </mal:errorRef>
            <mal:errorRef comment="Referenced directory could not be found.&#10;">
              <mal:type area="MAL" list="false" name="UNKNOWN"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
      </mal:capabilitySet>
      <mal:capabilitySet number="3">
                 <mal:requestIP comment="Request to retrieve the status of a file. The outcome of this request will be a file created in the remote file store containing the status information. The result file can then be downlinked using the 'Transfer File' operation.&#10;" name="getAttributes" number="8" supportInReplay="false">
          <mal:messages>
            <mal:request comment="">
              <mal:field canBeNull="true" comment="The path of the object to be queried" name="path">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
            </mal:request>
            <mal:response comment="">
              <mal:field canBeNull="true" comment="List of object attributes" name="attributes">
                <mal:type area="FBO" list="true" name="FileAttribute"/>
              </mal:field>
            </mal:response>
          </mal:messages>
        </mal:requestIP>
        
      </mal:capabilitySet>
      <mal:capabilitySet number="4">
        <mal:submitIP comment="Request to list the files and folders within a directory. The outcome of this request will be a file created in the remote file store containing the directory listing results. The directory listing results file can then be downlinked using the 'Transfer File' operation.&#10;NOTE: The directory listing is not recursive in terms of listing sub-directories. It will return a list of the file names and directory names for the requested directory.&#10;" name="listDirectory" number="9" supportInReplay="false">
          <mal:messages>
            <mal:submit>
              <mal:field canBeNull="true" comment="The path field contains is the logical path to where the name exists.&#10;" name="path">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
              <mal:field canBeNull="true" comment="The name field is the directory to be queried.&#10;" name="name">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
              <mal:field canBeNull="true" comment="The report path field is the logical path to where the 'Outcome File' will be created.&#10;" name="reportPath">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
              <mal:field canBeNull="true" comment="The report name is the name to use for the new file created on-board containing the directory listing results.&#10;The content and structure of the file containing the directory listing is mission specific.&#10;" name="reportName">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Invalid directory path or name.&#10;">
              <mal:type area="COM" list="false" name="INVALID"/>
            </mal:errorRef>
            <mal:errorRef comment="Referenced directory could not be found.&#10;">
              <mal:type area="MAL" list="false" name="UNKNOWN"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
      </mal:capabilitySet>
      <mal:capabilitySet comment="" number="5">
        <mal:requestIP comment="Returns True if it's a file, False if it's a folder" name="isFile" number="10" supportInReplay="false">
          <mal:messages>
            <mal:request comment="">
              <mal:field canBeNull="true" comment="" name="path">
                <mal:type area="MAL" list="false" name="Identifier"/>
              </mal:field>
            </mal:request>
            <mal:response comment="">
              <mal:field canBeNull="true" comment="True if it is a file" name="isFile">
                <mal:type area="MAL" list="false" name="Boolean"/>
              </mal:field>
            </mal:response>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="">
              <mal:type area="COM" list="false" name="INVALID"/>
            </mal:errorRef>
          </mal:errors>
        </mal:requestIP>
      <mal:requestIP comment="" name="getSize" number="11" supportInReplay="false">
         <mal:messages>
            <mal:request comment="">
              <mal:field canBeNull="true" comment="" name="path">
                <mal:type area="MAL" list="false" name="Identifier"/>
              </mal:field>
            </mal:request>
            <mal:response comment="">
            <mal:field canBeNull="true" comment="Size of the node" name="nodeSize">
                <mal:type area="MAL" list="false" name="ULong"/>
              </mal:field>
            </mal:response>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="">
              <mal:type area="COM" list="false" name="INVALID"/>
            </mal:errorRef>
          </mal:errors>
        </mal:requestIP>
      </mal:capabilitySet>
      <mal:errors>
        <mal:error comment="" name="FILESYSTEM_FULL" number="80001"/>
      </mal:errors>
    <com:features/>
    </mal:service>
    <mal:service comment="The File Transfer Service is responsible for initiating and monitoring file transfers from the spacecraft to the ground segment.&#10;&#10;The File systems can either be:&#10;&lt;ul&gt;&#10; &lt;li&gt;flat, where directory structures are not supported, or &lt;/li&gt;&#10; &lt;li&gt;structured, where files are stored within directories. &lt;/li&gt;&#10;&lt;/ul&gt;&#10;&#10;To locate and identify files and directories, this service uses the concept of repository path and name.&#10;The repository path is the logical path to where the object is located. A repository path can either represent:&#10;&lt;ul&gt;&#10; &lt;li&gt;a physical path such as a directory path within a file system, or &lt;/li&gt;&#10; &lt;li&gt;a logical path such as a mounted device (e.g. &quot;/mm1&quot; pointing to a mass memory device). &lt;/li&gt;&#10;&lt;/ul&gt;&#10;&#10;An object can either be a file or a directory. An object name is the unique identifier of that object within a repository. The combination of repository path and object name uniquely identifies an object at mission level and is named the object path (i.e. file path or directory path).&#10;&#10;" name="FileTransfer" number="30" xsi:type="com:ExtendedServiceType">
      <mal:capabilitySet number="1">
        <mal:progressIP comment="The request to the remote file store to transfer a file to another entity.&#10;&#10;" name="transferFile" number="1" supportInReplay="false">
          <mal:messages>
            <mal:progress>
              <mal:field canBeNull="true" comment="This field denotes the source entity on-board the spacecraft that will execute the file transfer.&#10;" name="srcEntity">
                <mal:type area="FBO" list="false" name="FileTransferEntity" service="FileTransfer"/>
              </mal:field>
              <mal:field canBeNull="true" comment="This field presents the service class to be used for the file transfer.&#10;" name="serviceClass">
                <mal:type area="FBO" list="false" name="FileTransferClass" service="FileTransfer"/>
              </mal:field>
              <mal:field canBeNull="true" comment="This field presents the priority level of the file transfer. The higher the value the higher the priority.&#10;" name="transferPriority">
                <mal:type area="MAL" list="false" name="UOctet"/>
              </mal:field>
              <mal:field canBeNull="true" comment="The 'Source Repository Path Value' field, this is the logical path to the directory where the source file to be transferred to the remote entity resides.&#10;" name="srcPath">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
              <mal:field canBeNull="true" comment="The 'Source File Name' field is the file to be retrieved from the on-board file store. &#10;A wildcard character (*) can be used to downlink all files for a given directory.&#10;" name="srcName">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
              <mal:field canBeNull="true" comment="The 'Destination Repository Path Value' field, this is the logical path to the directory where the transferred file will be placed at the destination entity.&#10;" name="dstPath">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
              <mal:field canBeNull="true" comment="The 'Destination File Name' is the new file to be created at the destination entity where the source file will be copied to.&#10;If a wildcard character (*) is used for the destination filename, then the transferred files will have the same file name as the original source files that have been transferred.&#10;" name="dstName">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
              <mal:field canBeNull="true" comment="This field denotes the destination entity of the delivery of the file transfer.&#10;" name="dstEntity">
                <mal:type area="FBO" list="false" name="FileTransferEntity" service="FileTransfer"/>
              </mal:field>
            </mal:progress>
            <mal:acknowledgement>
              <mal:field canBeNull="true" comment="The transfer count field holds the number of transfers that will be executed because of this operation.&#10;A file transfer report will be generated in response to the execution of this operation. A report will be generated for each subsequent file transfer that was initiated by this operation.&#10;" name="transferCount">
                <mal:type area="MAL" list="false" name="UShort"/>
              </mal:field>
              <mal:field canBeNull="true" name="transferReport">
                <mal:type area="FBO" list="false" name="FileTransferReport" service="FileTransfer"/>
              </mal:field>
            </mal:acknowledgement>
            <mal:update>
              <mal:field canBeNull="true" name="transferCount">
                <mal:type area="MAL" list="false" name="UShort"/>
              </mal:field>
              <mal:field canBeNull="true" name="transferRpt">
                <mal:type area="FBO" list="false" name="FileTransferReport" service="FileTransfer"/>
              </mal:field>
            </mal:update>
            <mal:response comment="The final response shall be generated once the final transfer has been completed.&#10;"/>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="File could not be found on remote file store.&#10;">
              <mal:type area="MAL" list="false" name="UNKNOWN"/>
            </mal:errorRef>
            <mal:errorRef comment="Invalid path or name used.&#10;">
              <mal:type area="COM" list="false" name="INVALID"/>
            </mal:errorRef>
            <mal:errorRef comment="Transfer aborted.&#10;">
              <mal:type area="FBO" list="false" name="ABORTED" service="FileTransfer"/>
            </mal:errorRef>
          </mal:errors>
        </mal:progressIP>
        <mal:requestIP comment="The request to retrieve the 'File Transfer Status' of File Transfers.&#10;" name="transferStatus" number="2" supportInReplay="false">
          <mal:messages>
            <mal:request>
              <mal:field canBeNull="true" comment="The transaction ID to query the status of - (This is a mission specific value).&#10;" name="transactionId">
                <mal:type area="MAL" list="true" name="String"/>
              </mal:field>
            </mal:request>
            <mal:response>
              <mal:field canBeNull="true" comment="A report with the state of the requested file transfers.&#10;" name="statusReport">
                <mal:type area="FBO" list="true" name="FileTransferStatus" service="FileTransfer"/>
              </mal:field>
            </mal:response>
          </mal:messages>
        </mal:requestIP>
      </mal:capabilitySet>
      <mal:capabilitySet number="2">
        <mal:submitIP comment="Request to abort an on-going File Transaction.&#10;" name="abortTransaction" number="3" supportInReplay="false">
          <mal:messages>
            <mal:submit>
              <mal:field canBeNull="true" comment="The transaction ID to abort - This is a mission specific value.&#10;" name="transactionId">
                <mal:type area="MAL" list="false" name="String"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Invalid transaction id.&#10;">
              <mal:type area="COM" list="false" name="INVALID"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
        <mal:submitIP comment="Request to suspend all File Transactions. This request will allow the closing of the receive and transmit windows which will suspend all on-going file transfers on-board. This will essentially put all file transactions in the 'Freeze' State.&#10;" name="suspendTransfers" number="4" supportInReplay="false">
          <mal:messages>
            <mal:submit>
              <mal:field canBeNull="true" comment="The Transmit (Tx) and/or Receive (Rx) windows to be closed.&#10;" name="window">
                <mal:type area="FBO" list="false" name="FileTransferWindow" service="FileTransfer"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
        </mal:submitIP>
        <mal:submitIP comment="Request to resume all File Transfers. This request will allow the opening of the uplink and downlink windows and will resume all suspended file transfers on-board.&#10;" name="resumeTransfers" number="5" supportInReplay="false">
          <mal:messages>
            <mal:submit>
              <mal:field canBeNull="true" comment="The Transmit (Tx) and/or Receive (Rx) windows to be opened.&#10;" name="window">
                <mal:type area="FBO" list="false" name="FileTransferWindow" service="FileTransfer"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
        </mal:submitIP>
        <mal:requestIP comment="Request to retrieve the status of the Transmit and Receive windows.&#10;" name="windowStatus" number="6" supportInReplay="false">
          <mal:messages>
            <mal:request/>
            <mal:response>
              <mal:field canBeNull="true" comment="Returns true if a window is open otherwise false.&#10;" name="txWindowOpen">
                <mal:type area="MAL" list="false" name="Boolean"/>
              </mal:field>
              <mal:field canBeNull="true" name="rxWindowOpen">
                <mal:type area="MAL" list="false" name="Boolean"/>
              </mal:field>
            </mal:response>
          </mal:messages>
        </mal:requestIP>
      </mal:capabilitySet>
      <mal:dataTypes>
        <mal:enumeration comment="This enumeration represents a file transfer entity.&#10;" name="FileTransferEntity" shortFormPart="1">
          <mal:item comment="" nvalue="0" value="SPACECRAFT"/>
          <mal:item comment="" nvalue="1" value="MCS"/>
          <mal:item comment="" nvalue="2" value="GS"/>
        </mal:enumeration>
        <mal:enumeration comment="" name="FileTransferClass" shortFormPart="2">
          <mal:item comment="" nvalue="1" value="UNRELIABLE"/>
          <mal:item comment="" nvalue="2" value="RELIABLE"/>
        </mal:enumeration>
        <mal:enumeration comment="" name="FileTransactionStatus" shortFormPart="3">
          <mal:item comment="" nvalue="1" value="EXECUTING"/>
          <mal:item comment="" nvalue="2" value="COMPLETED"/>
          <mal:item comment="" nvalue="3" value="FAILED"/>
          <mal:item comment="" nvalue="4" value="ABORTED"/>
          <mal:item comment="" nvalue="5" value="INVALID_ID"/>
        </mal:enumeration>
        <mal:enumeration comment="This enumeration represents the communication windows of a file transfer entity. It should be noted that the reception/transmission is from the point of view of the entity being addressed.&#10;" name="FileTransferWindow" shortFormPart="4">
          <mal:item comment="Transmission window&#10;" nvalue="1" value="TX_WINDOW"/>
          <mal:item comment="Reception window&#10;" nvalue="2" value="RX_WINDOW"/>
          <mal:item comment="Both TX and RX windows.&#10;" nvalue="3" value="BOTH_WINDOW"/>
        </mal:enumeration>
        <mal:composite comment="" name="FileTransferReport" shortFormPart="5">
          <mal:field canBeNull="false" comment="The transaction ID of the file transfer initiated on the spacecraft.&#10;" name="transactionId">
            <mal:type area="MAL" list="false" name="String"/>
          </mal:field>
          <mal:field canBeNull="false" comment="This is a copy of the corresponding fields from the packet header of the 'Transfer File' operation.&#10;" name="srcPktId">
            <mal:type area="MAL" list="false" name="UShort"/>
          </mal:field>
          <mal:field canBeNull="false" comment="This is a copy of the corresponding fields from the packet header of the 'Transfer File' operation.&#10;" name="srcPktCtrl">
            <mal:type area="MAL" list="false" name="UShort"/>
          </mal:field>
        </mal:composite>
        <mal:composite comment="" name="FileTransferStatus" shortFormPart="6">
          <mal:field canBeNull="false" comment="The transaction ID of the transfer - This is a mission specific value.&#10;" name="transactionId">
            <mal:type area="MAL" list="false" name="String"/>
          </mal:field>
          <mal:field canBeNull="false" comment="The status of the corresponding transaction IDs.&#10;" name="transactionStatus">
            <mal:type area="FBO" list="false" name="FileTransactionStatus" service="FileTransfer"/>
          </mal:field>
        </mal:composite>
      </mal:dataTypes>
      <mal:errors>
        <mal:error comment="Operation specific&#10;" name="ABORTED" number="80000"/>
      </mal:errors>
    <com:features/>
    </mal:service>
    <mal:dataTypes>
      <mal:composite comment="" name="FileAttribute" shortFormPart="7">
        <mal:extends>
          <mal:type area="MAL" list="false" name="Composite"/>
        </mal:extends>
        <mal:field canBeNull="false" comment="Identifies the node attribute of the attached value (e.g. &quot;Executable&quot;,&quot;Last Access&quot;,...)" name="AttributeIdentifier">
          <mal:type area="MAL" list="false" name="Identifier"/>
        </mal:field>
        <mal:field canBeNull="false" comment="Value of the attribute identified with &quot;AttributeIdentifier&quot;" name="AttributeValue">
          <mal:type area="MAL" list="false" name="Attribute"/>
        </mal:field>
      </mal:composite>
    </mal:dataTypes>
  </mal:area>
</mal:specification>
