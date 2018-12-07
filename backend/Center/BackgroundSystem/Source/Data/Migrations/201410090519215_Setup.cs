// <auto-generated />
namespace Gorba.Center.BackgroundSystem.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Setup : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.AssociationTenantUserUserRoles",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        User_Id = c.Int(nullable: false),
                        Tenant_Id = c.Int(nullable: false),
                        UserRole_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.User_Id, cascadeDelete: true)
                .ForeignKey("dbo.Tenants", t => t.Tenant_Id, cascadeDelete: true)
                .ForeignKey("dbo.UserRoles", t => t.UserRole_Id, cascadeDelete: true)
                .Index(t => t.User_Id)
                .Index(t => t.Tenant_Id)
                .Index(t => t.UserRole_Id);
            
            CreateTable(
                "dbo.Tenants",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        Name = c.String(nullable: false, maxLength: 100),
                        Description = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.Name, unique: true);
            
            CreateTable(
                "dbo.UpdateGroups",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        Name = c.String(nullable: false),
                        Description = c.String(),
                        Tenant_Id = c.Int(nullable: false),
                        UnitConfiguration_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Tenants", t => t.Tenant_Id)
                .ForeignKey("dbo.UnitConfigurations", t => t.UnitConfiguration_Id)
                .Index(t => t.Tenant_Id)
                .Index(t => t.UnitConfiguration_Id);
            
            CreateTable(
                "dbo.Units",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        Name = c.String(nullable: false),
                        NetworkAddress = c.String(),
                        Description = c.String(),
                        ProductType_Id = c.Int(nullable: false),
                        Tenant_Id = c.Int(nullable: false),
                        UpdateGroup_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ProductTypes", t => t.ProductType_Id, cascadeDelete: true)
                .ForeignKey("dbo.Tenants", t => t.Tenant_Id, cascadeDelete: true)
                .ForeignKey("dbo.UpdateGroups", t => t.UpdateGroup_Id)
                .Index(t => t.ProductType_Id)
                .Index(t => t.Tenant_Id)
                .Index(t => t.UpdateGroup_Id);
            
            CreateTable(
                "dbo.ProductTypes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        UnitType = c.Int(nullable: false),
                        Name = c.String(nullable: false),
                        Description = c.String(),
                        HardwareDescriptorXml = c.String(),
                        HardwareDescriptorXmlType = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.UpdateCommands",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        UpdateIndex = c.Int(nullable: false),
                        CommandXml = c.String(),
                        CommandXmlType = c.String(),
                        WasInstalled = c.Boolean(nullable: false),
                        Unit_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Units", t => t.Unit_Id, cascadeDelete: true)
                .Index(t => t.Unit_Id);
            
            CreateTable(
                "dbo.UpdateFeedbacks",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        Timestamp = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        State = c.Int(nullable: false),
                        FeedbackXml = c.String(),
                        FeedbackXmlType = c.String(),
                        UpdateCommand_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.UpdateCommands", t => t.UpdateCommand_Id, cascadeDelete: true)
                .Index(t => t.UpdateCommand_Id);
            
            CreateTable(
                "dbo.UpdateParts",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        Type = c.Int(nullable: false),
                        Start = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        End = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        Description = c.String(),
                        StructureXml = c.String(),
                        StructureXmlType = c.String(),
                        UpdateCommand_Id = c.Int(nullable: false),
                        UpdateGroup_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.UpdateCommands", t => t.UpdateCommand_Id)
                .ForeignKey("dbo.UpdateGroups", t => t.UpdateGroup_Id, cascadeDelete: true)
                .Index(t => t.UpdateCommand_Id)
                .Index(t => t.UpdateGroup_Id);
            
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        Username = c.String(nullable: false, maxLength: 100),
                        Domain = c.String(),
                        HashedPassword = c.String(),
                        FirstName = c.String(),
                        LastName = c.String(),
                        Email = c.String(),
                        Culture = c.String(),
                        TimeZone = c.String(),
                        Description = c.String(),
                        LastLoginAttempt = c.DateTime(precision: 7, storeType: "datetime2"),
                        LastSuccessfulLogin = c.DateTime(precision: 7, storeType: "datetime2"),
                        ConsecutiveLoginFailures = c.Int(nullable: false),
                        IsEnabled = c.Boolean(nullable: false),
                        OwnerTenant_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Tenants", t => t.OwnerTenant_Id)
                .Index(t => t.Username, unique: true)
                .Index(t => t.OwnerTenant_Id);
            
            CreateTable(
                "dbo.UserRoles",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        Name = c.String(nullable: false, maxLength: 100),
                        Description = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.Name, unique: true);
            
            CreateTable(
                "dbo.Authorizations",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        DataScope = c.Int(nullable: false),
                        Permission = c.Int(nullable: false),
                        UserRole_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.UserRoles", t => t.UserRole_Id, cascadeDelete: true)
                .Index(t => t.UserRole_Id);
            
            CreateTable(
                "dbo.Documents",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        Name = c.String(nullable: false),
                        Description = c.String(),
                        Tenant_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Tenants", t => t.Tenant_Id, cascadeDelete: true)
                .Index(t => t.Tenant_Id);
            
            CreateTable(
                "dbo.DocumentVersions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        Major = c.Int(nullable: false),
                        Minor = c.Int(nullable: false),
                        ContentXml = c.String(),
                        ContentXmlType = c.String(),
                        Description = c.String(),
                        CreatingUser_Id = c.Int(),
                        Document_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.CreatingUser_Id)
                .ForeignKey("dbo.Documents", t => t.Document_Id, cascadeDelete: true)
                .Index(t => t.CreatingUser_Id)
                .Index(t => t.Document_Id);
            
            CreateTable(
                "dbo.Packages",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        PackageId = c.String(nullable: false, maxLength: 100),
                        ProductName = c.String(nullable: false, maxLength: 100),
                        Description = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.PackageId, unique: true)
                .Index(t => t.ProductName, unique: true);
            
            CreateTable(
                "dbo.PackageVersions",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        SoftwareVersion = c.String(),
                        StructureXml = c.String(),
                        StructureXmlType = c.String(),
                        Description = c.String(),
                        Package_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Packages", t => t.Package_Id, cascadeDelete: true)
                .Index(t => t.Package_Id);
            
            CreateTable(
                "dbo.Resources",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        OriginalFilename = c.String(),
                        Description = c.String(),
                        Hash = c.String(maxLength: 100),
                        ThumbnailHash = c.String(),
                        MimeType = c.String(),
                        Length = c.Long(nullable: false),
                        UploadingUser_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Users", t => t.UploadingUser_Id)
                .Index(t => t.Hash, unique: true)
                .Index(t => t.UploadingUser_Id);
            
            CreateTable(
                "dbo.UnitConfigurations",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CreatedOn = c.DateTime(nullable: false, precision: 7, storeType: "datetime2"),
                        LastModifiedOn = c.DateTime(precision: 7, storeType: "datetime2"),
                        Version = c.Int(nullable: false),
                        Document_Id = c.Int(nullable: false),
                        ProductType_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Documents", t => t.Document_Id, cascadeDelete: true)
                .ForeignKey("dbo.ProductTypes", t => t.ProductType_Id, cascadeDelete: true)
                .Index(t => t.Document_Id)
                .Index(t => t.ProductType_Id);
            
            CreateTable(
                "dbo.UpdatePartUpdateCommands",
                c => new
                    {
                        UpdatePart_Id = c.Int(nullable: false),
                        UpdateCommand_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.UpdatePart_Id, t.UpdateCommand_Id })
                .ForeignKey("dbo.UpdateParts", t => t.UpdatePart_Id, cascadeDelete: true)
                .ForeignKey("dbo.UpdateCommands", t => t.UpdateCommand_Id, cascadeDelete: true)
                .Index(t => t.UpdatePart_Id)
                .Index(t => t.UpdateCommand_Id);
            this.SetDefaultValueForVersion();
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.UpdateGroups", "UnitConfiguration_Id", "dbo.UnitConfigurations");
            DropForeignKey("dbo.UnitConfigurations", "ProductType_Id", "dbo.ProductTypes");
            DropForeignKey("dbo.UnitConfigurations", "Document_Id", "dbo.Documents");
            DropForeignKey("dbo.Resources", "UploadingUser_Id", "dbo.Users");
            DropForeignKey("dbo.PackageVersions", "Package_Id", "dbo.Packages");
            DropForeignKey("dbo.DocumentVersions", "Document_Id", "dbo.Documents");
            DropForeignKey("dbo.DocumentVersions", "CreatingUser_Id", "dbo.Users");
            DropForeignKey("dbo.Documents", "Tenant_Id", "dbo.Tenants");
            DropForeignKey("dbo.AssociationTenantUserUserRoles", "UserRole_Id", "dbo.UserRoles");
            DropForeignKey("dbo.Authorizations", "UserRole_Id", "dbo.UserRoles");
            DropForeignKey("dbo.AssociationTenantUserUserRoles", "Tenant_Id", "dbo.Tenants");
            DropForeignKey("dbo.Users", "OwnerTenant_Id", "dbo.Tenants");
            DropForeignKey("dbo.AssociationTenantUserUserRoles", "User_Id", "dbo.Users");
            DropForeignKey("dbo.UpdateGroups", "Tenant_Id", "dbo.Tenants");
            DropForeignKey("dbo.UpdateParts", "UpdateGroup_Id", "dbo.UpdateGroups");
            DropForeignKey("dbo.Units", "UpdateGroup_Id", "dbo.UpdateGroups");
            DropForeignKey("dbo.UpdateCommands", "Unit_Id", "dbo.Units");
            DropForeignKey("dbo.UpdateParts", "UpdateCommand_Id", "dbo.UpdateCommands");
            DropForeignKey("dbo.UpdatePartUpdateCommands", "UpdateCommand_Id", "dbo.UpdateCommands");
            DropForeignKey("dbo.UpdatePartUpdateCommands", "UpdatePart_Id", "dbo.UpdateParts");
            DropForeignKey("dbo.UpdateFeedbacks", "UpdateCommand_Id", "dbo.UpdateCommands");
            DropForeignKey("dbo.Units", "Tenant_Id", "dbo.Tenants");
            DropForeignKey("dbo.Units", "ProductType_Id", "dbo.ProductTypes");
            DropIndex("dbo.UpdatePartUpdateCommands", new[] { "UpdateCommand_Id" });
            DropIndex("dbo.UpdatePartUpdateCommands", new[] { "UpdatePart_Id" });
            DropIndex("dbo.UnitConfigurations", new[] { "ProductType_Id" });
            DropIndex("dbo.UnitConfigurations", new[] { "Document_Id" });
            DropIndex("dbo.Resources", new[] { "UploadingUser_Id" });
            DropIndex("dbo.Resources", new[] { "Hash" });
            DropIndex("dbo.PackageVersions", new[] { "Package_Id" });
            DropIndex("dbo.Packages", new[] { "ProductName" });
            DropIndex("dbo.Packages", new[] { "PackageId" });
            DropIndex("dbo.DocumentVersions", new[] { "Document_Id" });
            DropIndex("dbo.DocumentVersions", new[] { "CreatingUser_Id" });
            DropIndex("dbo.Documents", new[] { "Tenant_Id" });
            DropIndex("dbo.Authorizations", new[] { "UserRole_Id" });
            DropIndex("dbo.UserRoles", new[] { "Name" });
            DropIndex("dbo.Users", new[] { "OwnerTenant_Id" });
            DropIndex("dbo.Users", new[] { "Username" });
            DropIndex("dbo.UpdateParts", new[] { "UpdateGroup_Id" });
            DropIndex("dbo.UpdateParts", new[] { "UpdateCommand_Id" });
            DropIndex("dbo.UpdateFeedbacks", new[] { "UpdateCommand_Id" });
            DropIndex("dbo.UpdateCommands", new[] { "Unit_Id" });
            DropIndex("dbo.Units", new[] { "UpdateGroup_Id" });
            DropIndex("dbo.Units", new[] { "Tenant_Id" });
            DropIndex("dbo.Units", new[] { "ProductType_Id" });
            DropIndex("dbo.UpdateGroups", new[] { "UnitConfiguration_Id" });
            DropIndex("dbo.UpdateGroups", new[] { "Tenant_Id" });
            DropIndex("dbo.Tenants", new[] { "Name" });
            DropIndex("dbo.AssociationTenantUserUserRoles", new[] { "UserRole_Id" });
            DropIndex("dbo.AssociationTenantUserUserRoles", new[] { "Tenant_Id" });
            DropIndex("dbo.AssociationTenantUserUserRoles", new[] { "User_Id" });
            DropTable("dbo.UpdatePartUpdateCommands");
            DropTable("dbo.UnitConfigurations");
            DropTable("dbo.Resources");
            DropTable("dbo.PackageVersions");
            DropTable("dbo.Packages");
            DropTable("dbo.DocumentVersions");
            DropTable("dbo.Documents");
            DropTable("dbo.Authorizations");
            DropTable("dbo.UserRoles");
            DropTable("dbo.Users");
            DropTable("dbo.UpdateParts");
            DropTable("dbo.UpdateFeedbacks");
            DropTable("dbo.UpdateCommands");
            DropTable("dbo.ProductTypes");
            DropTable("dbo.Units");
            DropTable("dbo.UpdateGroups");
            DropTable("dbo.Tenants");
            DropTable("dbo.AssociationTenantUserUserRoles");
        }
    }
}