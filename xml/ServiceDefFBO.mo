<?xml version="1.0" encoding="UTF-8"?>
<mal:specification xmlns:com="http://www.ccsds.org/schema/COMSchema"
                   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                   xmlns:mal="http://www.ccsds.org/schema/ServiceSchema">
  <mal:area name="FBO" number="30" version="1">
    <mal:service xsi:type="com:ExtendedServiceType" name="FileManagement" number="29"
                 comment="The file management service provides the capability to manage files within one or more file systems. It is not content aware, and manipulates files as black boxes. It allows controlling flat (i.e. without support for directories) or structured (i.e. with directory support) file systems by providing functionalities to manage files and directories.&#xA;&#xA;File usage is not within the scope of this service. MO services which can use files have dedicated subtypes supporting the utilization of files within their context.&#xA;&#xA;File transfer is not within the scope of this service, unless the file management service has access to both file systems (in which case a copy operation across file systems is effectively a file transfer). It is assumed that files can be uplinked or downlinked using a dedicated transfer layer (e.g. CFDP).&#xA;">
      <mal:capabilitySet number="1">
        <mal:submitIP name="createFile" number="1" supportInReplay="false"
                      comment="This operation will create a new empty file on the remote file store.&#xA;">
          <mal:messages>
            <mal:submit>
              <mal:field name="path"
                         comment="The path field contains the logical path to where the file is to be created.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="name" comment="The name field contains the name of the new file.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="maxFileSize"
                         comment="The field maxFileSize contains the maximum size allowed for the newly created file. If the size of the file to create is not bounded, the maximum size shall be set to 0.&#xA;">
                <mal:type name="UInteger" area="MAL"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Invalid file path or name.&#xA;">
              <mal:type name="INVALID" area="COM"/>
            </mal:errorRef>
            <mal:errorRef comment="File already exists.&#xA;">
              <mal:type name="DUPLICATE" area="COM"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
        <mal:submitIP name="renameFile" number="2" supportInReplay="false"
                      comment="This operation will rename a file on the remote file store.&#xA;">
          <mal:messages>
            <mal:submit>
              <mal:field name="path"
                         comment="The path field contains the logical path to where the file to be renamed exists.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="oldName"
                         comment="The old name field contains the name of the file to be renamed.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="newName"
                         comment="The new name field contains the new name for the file.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Invalid file path or name.&#xA;">
              <mal:type name="INVALID" area="COM"/>
            </mal:errorRef>
            <mal:errorRef comment="File already exists.&#xA;">
              <mal:type name="DUPLICATE" area="COM"/>
            </mal:errorRef>
            <mal:errorRef comment="Referenced file could not be found.&#xA;">
              <mal:type name="UNKNOWN" area="MAL"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
        <mal:submitIP name="deleteFile" number="3" supportInReplay="false"
                      comment="This operation will delete the file from the remote file store.&#xA;">
          <mal:messages>
            <mal:submit>
              <mal:field name="path"
                         comment="The path field contains the logical path to where the file to be deleted exists.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="name"
                         comment="The name field contains the file that will be deleted from the remote file store.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Invalid file path or name.&#xA;">
              <mal:type name="INVALID" area="COM"/>
            </mal:errorRef>
            <mal:errorRef comment="Referenced file could not be found.&#xA;">
              <mal:type name="UNKNOWN" area="MAL"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
      </mal:capabilitySet>
      <mal:capabilitySet number="2">
        <mal:submitIP name="createDirectory" number="4" supportInReplay="false"
                      comment="This operation will create a new empty directory on the remote file store.&#xA;">
          <mal:messages>
            <mal:submit>
              <mal:field name="path"
                         comment="The path field contains the logical path to where the directory is to be created.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="name" comment="The name field contains the name of the new directory.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Directory already exists.&#xA;">
              <mal:type name="DUPLICATE" area="COM"/>
            </mal:errorRef>
            <mal:errorRef comment="Invalid file path or name.&#xA;">
              <mal:type name="INVALID" area="COM"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
        <mal:submitIP name="renameDirectory" number="5" supportInReplay="false"
                      comment="This operation will rename a directory on the remote file store.&#xA;">
          <mal:messages>
            <mal:submit>
              <mal:field name="path"
                         comment="The path field contains the logical path to where the directory to be renamed exists.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="oldName"
                         comment="The old name field contains the name of the directory to be renamed.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="newName"
                         comment="The new name field contains the new name for the directory.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Directory already exists.&#xA;">
              <mal:type name="DUPLICATE" area="COM"/>
            </mal:errorRef>
            <mal:errorRef comment="Invalid file path or name.&#xA;">
              <mal:type name="INVALID" area="COM"/>
            </mal:errorRef>
            <mal:errorRef comment="Referenced directory could not be found.&#xA;">
              <mal:type name="UNKNOWN" area="MAL"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
        <mal:submitIP name="deleteDirectory" number="6" supportInReplay="false"
                      comment="This operation will delete the directory and its contents from the remote file store.&#xA;">
          <mal:messages>
            <mal:submit>
              <mal:field name="path"
                         comment="The path field contains the logical path to where the directory to be deleted exists.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="name"
                         comment="The name field contains the directory that will be deleted from the remote file store.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Invalid directory path or name.&#xA;">
              <mal:type name="INVALID" area="COM"/>
            </mal:errorRef>
            <mal:errorRef comment="Referenced directory could not be found.&#xA;">
              <mal:type name="UNKNOWN" area="MAL"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
      </mal:capabilitySet>
      <mal:capabilitySet number="3">
        <mal:submitIP name="fileStatus" number="7" supportInReplay="false"
                      comment="Request to retrieve the status of a file. The outcome of this request will be a file created in the remote file store containing the status information. The result file can then be downlinked using the 'Transfer File' operation.&#xA;">
          <mal:messages>
            <mal:submit>
              <mal:field name="path"
                         comment="The path field contains is the logical path to where the name exists.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="name" comment="The name field is the file to be queried.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="reportPath"
                         comment="The report path field is the logical path to where the 'Outcome File' will be created.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="reportName"
                         comment="The report name is the name to use for the new file created on-board containing the file information result.&#xA;The content and structure of the file containing the result is mission specific.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Referenced file could not be found.&#xA;">
              <mal:type name="UNKNOWN" area="MAL"/>
            </mal:errorRef>
            <mal:errorRef comment="Invalid directory path or name.&#xA;">
              <mal:type name="INVALID" area="COM"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
      </mal:capabilitySet>
      <mal:capabilitySet number="4">
        <mal:submitIP name="listDirectory" number="8" supportInReplay="false"
                      comment="Request to list the files and folders within a directory. The outcome of this request will be a file created in the remote file store containing the directory listing results. The directory listing results file can then be downlinked using the 'Transfer File' operation.&#xA;NOTE: The directory listing is not recursive in terms of listing sub-directories. It will return a list of the file names and directory names for the requested directory.&#xA;">
          <mal:messages>
            <mal:submit>
              <mal:field name="path"
                         comment="The path field contains is the logical path to where the name exists.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="name" comment="The name field is the directory to be queried.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="reportPath"
                         comment="The report path field is the logical path to where the 'Outcome File' will be created.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="reportName"
                         comment="The report name is the name to use for the new file created on-board containing the directory listing results.&#xA;The content and structure of the file containing the directory listing is mission specific.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Invalid directory path or name.&#xA;">
              <mal:type name="INVALID" area="COM"/>
            </mal:errorRef>
            <mal:errorRef comment="Referenced directory could not be found.&#xA;">
              <mal:type name="UNKNOWN" area="MAL"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
      </mal:capabilitySet>
    </mal:service>
    <mal:service xsi:type="com:ExtendedServiceType" name="FileTransfer" number="30"
                 comment="The File Transfer Service is responsible for initiating and monitoring file transfers from the spacecraft to the ground segment.&#xA;&#xA;The File systems can either be:&#xA;&lt;ul&gt;&#xA; &lt;li&gt;flat, where directory structures are not supported, or &lt;/li&gt;&#xA; &lt;li&gt;structured, where files are stored within directories. &lt;/li&gt;&#xA;&lt;/ul&gt;&#xA;&#xA;To locate and identify files and directories, this service uses the concept of repository path and name.&#xA;The repository path is the logical path to where the object is located. A repository path can either represent:&#xA;&lt;ul&gt;&#xA; &lt;li&gt;a physical path such as a directory path within a file system, or &lt;/li&gt;&#xA; &lt;li&gt;a logical path such as a mounted device (e.g. &#34;/mm1&#34; pointing to a mass memory device). &lt;/li&gt;&#xA;&lt;/ul&gt;&#xA;&#xA;An object can either be a file or a directory. An object name is the unique identifier of that object within a repository. The combination of repository path and object name uniquely identifies an object at mission level and is named the object path (i.e. file path or directory path).&#xA;&#xA;">
      <mal:capabilitySet number="1">
        <mal:progressIP name="transferFile" number="1" supportInReplay="false"
                        comment="The request to the remote file store to transfer a file to another entity.&#xA;&#xA;">
          <mal:messages>
            <mal:progress>
              <mal:field name="srcEntity"
                         comment="This field denotes the source entity on-board the spacecraft that will execute the file transfer.&#xA;">
                <mal:type name="FileTransferEntity" service="FileTransfer" area="FBO"/>
              </mal:field>
              <mal:field name="serviceClass"
                         comment="This field presents the service class to be used for the file transfer.&#xA;">
                <mal:type name="FileTransferClass" service="FileTransfer" area="FBO"/>
              </mal:field>
              <mal:field name="transferPriority"
                         comment="This field presents the priority level of the file transfer. The higher the value the higher the priority.&#xA;">
                <mal:type name="UOctet" area="MAL"/>
              </mal:field>
              <mal:field name="srcPath"
                         comment="The 'Source Repository Path Value' field, this is the logical path to the directory where the source file to be transferred to the remote entity resides.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="srcName"
                         comment="The 'Source File Name' field is the file to be retrieved from the on-board file store. &#xA;A wildcard character (*) can be used to downlink all files for a given directory.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="dstPath"
                         comment="The 'Destination Repository Path Value' field, this is the logical path to the directory where the transferred file will be placed at the destination entity.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="dstName"
                         comment="The 'Destination File Name' is the new file to be created at the destination entity where the source file will be copied to.&#xA;If a wildcard character (*) is used for the destination filename, then the transferred files will have the same file name as the original source files that have been transferred.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
              <mal:field name="dstEntity"
                         comment="This field denotes the destination entity of the delivery of the file transfer.&#xA;">
                <mal:type name="FileTransferEntity" service="FileTransfer" area="FBO"/>
              </mal:field>
            </mal:progress>
            <mal:acknowledgement>
              <mal:field name="transferCount"
                         comment="The transfer count field holds the number of transfers that will be executed because of this operation.&#xA;A file transfer report will be generated in response to the execution of this operation. A report will be generated for each subsequent file transfer that was initiated by this operation.&#xA;">
                <mal:type name="UShort" area="MAL"/>
              </mal:field>
              <mal:field name="transferReport">
                <mal:type name="FileTransferReport" service="FileTransfer" area="FBO"/>
              </mal:field>
            </mal:acknowledgement>
            <mal:update>
              <mal:field name="transferCount">
                <mal:type name="UShort" area="MAL"/>
              </mal:field>
              <mal:field name="transferRpt">
                <mal:type name="FileTransferReport" service="FileTransfer" area="FBO"/>
              </mal:field>
            </mal:update>
            <mal:response comment="The final response shall be generated once the final transfer has been completed.&#xA;"/>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="File could not be found on remote file store.&#xA;">
              <mal:type name="UNKNOWN" area="MAL"/>
            </mal:errorRef>
            <mal:errorRef comment="Invalid path or name used.&#xA;">
              <mal:type name="INVALID" area="COM"/>
            </mal:errorRef>
            <mal:errorRef comment="Transfer aborted.&#xA;">
              <mal:type name="ABORTED" service="FileTransfer" area="FBO"/>
            </mal:errorRef>
          </mal:errors>
        </mal:progressIP>
        <mal:requestIP name="transferStatus" number="2" supportInReplay="false"
                       comment="The request to retrieve the 'File Transfer Status' of File Transfers.&#xA;">
          <mal:messages>
            <mal:request>
              <mal:field name="transactionId"
                         comment="The transaction ID to query the status of - (This is a mission specific value).&#xA;">
                <mal:type list="true" name="String" area="MAL"/>
              </mal:field>
            </mal:request>
            <mal:response>
              <mal:field name="statusReport"
                         comment="A report with the state of the requested file transfers.&#xA;">
                <mal:type list="true" name="FileTransferStatus" service="FileTransfer" area="FBO"/>
              </mal:field>
            </mal:response>
          </mal:messages>
        </mal:requestIP>
      </mal:capabilitySet>
      <mal:capabilitySet number="2">
        <mal:submitIP name="abortTransaction" number="3" supportInReplay="false"
                      comment="Request to abort an on-going File Transaction.&#xA;">
          <mal:messages>
            <mal:submit>
              <mal:field name="transactionId"
                         comment="The transaction ID to abort - This is a mission specific value.&#xA;">
                <mal:type name="String" area="MAL"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
          <mal:errors>
            <mal:errorRef comment="Invalid transaction id.&#xA;">
              <mal:type name="INVALID" area="COM"/>
            </mal:errorRef>
          </mal:errors>
        </mal:submitIP>
        <mal:submitIP name="suspendTransfers" number="4" supportInReplay="false"
                      comment="Request to suspend all File Transactions. This request will allow the closing of the receive and transmit windows which will suspend all on-going file transfers on-board. This will essentially put all file transactions in the 'Freeze' State.&#xA;">
          <mal:messages>
            <mal:submit>
              <mal:field name="window"
                         comment="The Transmit (Tx) and/or Receive (Rx) windows to be closed.&#xA;">
                <mal:type name="FileTransferWindow" service="FileTransfer" area="FBO"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
        </mal:submitIP>
        <mal:submitIP name="resumeTransfers" number="5" supportInReplay="false"
                      comment="Request to resume all File Transfers. This request will allow the opening of the uplink and downlink windows and will resume all suspended file transfers on-board.&#xA;">
          <mal:messages>
            <mal:submit>
              <mal:field name="window"
                         comment="The Transmit (Tx) and/or Receive (Rx) windows to be opened.&#xA;">
                <mal:type name="FileTransferWindow" service="FileTransfer" area="FBO"/>
              </mal:field>
            </mal:submit>
          </mal:messages>
        </mal:submitIP>
        <mal:requestIP name="windowStatus" number="6" supportInReplay="false"
                       comment="Request to retrieve the status of the Transmit and Receive windows.&#xA;">
          <mal:messages>
            <mal:request/>
            <mal:response>
              <mal:field name="txWindowOpen"
                         comment="Returns true if a window is open otherwise false.&#xA;">
                <mal:type name="Boolean" area="MAL"/>
              </mal:field>
              <mal:field name="rxWindowOpen">
                <mal:type name="Boolean" area="MAL"/>
              </mal:field>
            </mal:response>
          </mal:messages>
        </mal:requestIP>
      </mal:capabilitySet>
      <mal:dataTypes>
        <mal:enumeration name="FileTransferEntity" shortFormPart="1"
                         comment="This enumeration represents a file transfer entity.&#xA;">
          <mal:item value="SPACECRAFT" nvalue="0" comment=""/>
          <mal:item value="MCS" nvalue="1" comment=""/>
          <mal:item value="GS" nvalue="2" comment=""/>
        </mal:enumeration>
        <mal:enumeration name="FileTransferClass" shortFormPart="2" comment="">
          <mal:item value="UNRELIABLE" nvalue="1" comment=""/>
          <mal:item value="RELIABLE" nvalue="2" comment=""/>
        </mal:enumeration>
        <mal:enumeration name="FileTransactionStatus" shortFormPart="3" comment="">
          <mal:item value="EXECUTING" nvalue="1" comment=""/>
          <mal:item value="COMPLETED" nvalue="2" comment=""/>
          <mal:item value="FAILED" nvalue="3" comment=""/>
          <mal:item value="ABORTED" nvalue="4" comment=""/>
          <mal:item value="INVALID_ID" nvalue="5" comment=""/>
        </mal:enumeration>
        <mal:enumeration name="FileTransferWindow" shortFormPart="4"
                         comment="This enumeration represents the communication windows of a file transfer entity. It should be noted that the reception/transmission is from the point of view of the entity being addressed.&#xA;">
          <mal:item value="TX_WINDOW" nvalue="1" comment="Transmission window&#xA;"/>
          <mal:item value="RX_WINDOW" nvalue="2" comment="Reception window&#xA;"/>
          <mal:item value="BOTH_WINDOW" nvalue="3" comment="Both TX and RX windows.&#xA;"/>
        </mal:enumeration>
        <mal:composite name="FileTransferReport" shortFormPart="5" comment="">
          <mal:field name="transactionId" canBeNull="false"
                     comment="The transaction ID of the file transfer initiated on the spacecraft.&#xA;">
            <mal:type name="String" area="MAL"/>
          </mal:field>
          <mal:field name="srcPktId" canBeNull="false"
                     comment="This is a copy of the corresponding fields from the packet header of the 'Transfer File' operation.&#xA;">
            <mal:type name="UShort" area="MAL"/>
          </mal:field>
          <mal:field name="srcPktCtrl" canBeNull="false"
                     comment="This is a copy of the corresponding fields from the packet header of the 'Transfer File' operation.&#xA;">
            <mal:type name="UShort" area="MAL"/>
          </mal:field>
        </mal:composite>
        <mal:composite name="FileTransferStatus" shortFormPart="6" comment="">
          <mal:field name="transactionId" canBeNull="false"
                     comment="The transaction ID of the transfer - This is a mission specific value.&#xA;">
            <mal:type name="String" area="MAL"/>
          </mal:field>
          <mal:field name="transactionStatus" canBeNull="false"
                     comment="The status of the corresponding transaction IDs.&#xA;">
            <mal:type name="FileTransactionStatus" service="FileTransfer" area="FBO"/>
          </mal:field>
        </mal:composite>
      </mal:dataTypes>
      <mal:errors>
        <mal:error name="ABORTED" number="80000" comment="Operation specific&#xA;"/>
      </mal:errors>
    </mal:service>
  </mal:area>
</mal:specification>