-- =====================================================
-- Author:		EPT
-- Create date: 06.05.2013
-- Description:	Deletes all scheduled and realtime data 
--				related to a specific provider.
-- =====================================================
USE [Gorba_CenterOnline]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DECLARE @providerId int = 0

IF @providerId = 0
BEGIN
	print 'The provider id is 0. You should change it to the desired provider id.'
END

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION DeleteItcsRealtimeData_Tx
			DELETE [ItcsRealtimeDataSet]
			FROM [ItcsRealtimeDataSet] [R]
			INNER JOIN [ItcsTimeTableEntrySet] [E] ON [E].[Id] = [R].[ItcsTimeTableEntryId]
			INNER JOIN [ItcsDisplayAreaSet] [D] ON [D].[Id] = [E].[ItcsDisplayAreaId]
			WHERE [D].[ProviderId] = @providerId
		COMMIT TRANSACTION
		BEGIN TRANSACTION DeleteItcsTimeTableEntries_Tx
			DELETE [ItcsTimeTableEntrySet]
			FROM [ItcsTimeTableEntrySet] [E]
			INNER JOIN [ItcsDisplayAreaSet] [D] ON [D].[Id] = [E].[ItcsDisplayAreaId]
			WHERE [D].[ProviderId] = @providerId
		COMMIT TRANSACTION 
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRAN --RollBack in case of Error
			END
			
			DECLARE @message varchar(500) = ERROR_MESSAGE()
			DECLARE @severity int = ERROR_SEVERITY()
			RAISERROR(@message, @severity, 1)
	END CATCH
	
END


