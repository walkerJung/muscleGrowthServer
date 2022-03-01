-- CreateTable
CREATE TABLE `MappingRestaurant` (
    `code` INTEGER NOT NULL AUTO_INCREMENT,
    `mappingCode` INTEGER NOT NULL,
    `restaurantMenu` VARCHAR(191) NOT NULL,
    `restaurantNutrition` VARCHAR(191) NOT NULL,
    `restaurantTip` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `MappingRestaurant_mappingCode_key`(`mappingCode`),
    PRIMARY KEY (`code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MappingGym` (
    `code` INTEGER NOT NULL AUTO_INCREMENT,
    `mappingCode` INTEGER NOT NULL,
    `gymFacility` VARCHAR(191) NOT NULL,
    `gymMood` VARCHAR(191) NOT NULL,
    `gymGood` VARCHAR(191) NOT NULL,
    `gymBad` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `MappingGym_mappingCode_key`(`mappingCode`),
    PRIMARY KEY (`code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MappingComment` (
    `code` INTEGER NOT NULL AUTO_INCREMENT,
    `userCode` INTEGER NOT NULL,
    `mappingCode` INTEGER NOT NULL,
    `commentContent` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `MappingComment_mappingCode_key`(`mappingCode`),
    PRIMARY KEY (`code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MappingFile` (
    `code` INTEGER NOT NULL AUTO_INCREMENT,
    `timeStamp` VARCHAR(191) NOT NULL,
    `imgSrc` VARCHAR(191) NOT NULL,
    `imgName` VARCHAR(191) NOT NULL,
    `imgType` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WorkoutLog` (
    `code` INTEGER NOT NULL AUTO_INCREMENT,
    `userCode` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WorkoutType` (
    `code` INTEGER NOT NULL AUTO_INCREMENT,
    `workoutLogCode` INTEGER NOT NULL,
    `workoutName` VARCHAR(191) NOT NULL,
    `workoutComment` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WorkoutPerformance` (
    `code` INTEGER NOT NULL AUTO_INCREMENT,
    `workoutTypeCode` INTEGER NOT NULL,
    `workoutSet` INTEGER NOT NULL,
    `workoutCount` INTEGER NOT NULL,
    `workoutWeight` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `MappingRestaurant` ADD CONSTRAINT `MappingRestaurant_mappingCode_fkey` FOREIGN KEY (`mappingCode`) REFERENCES `Mapping`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MappingGym` ADD CONSTRAINT `MappingGym_mappingCode_fkey` FOREIGN KEY (`mappingCode`) REFERENCES `Mapping`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MappingComment` ADD CONSTRAINT `MappingComment_userCode_fkey` FOREIGN KEY (`userCode`) REFERENCES `User`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MappingComment` ADD CONSTRAINT `MappingComment_mappingCode_fkey` FOREIGN KEY (`mappingCode`) REFERENCES `Mapping`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MappingFile` ADD CONSTRAINT `MappingFile_timeStamp_fkey` FOREIGN KEY (`timeStamp`) REFERENCES `Mapping`(`timeStamp`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WorkoutLog` ADD CONSTRAINT `WorkoutLog_userCode_fkey` FOREIGN KEY (`userCode`) REFERENCES `User`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WorkoutType` ADD CONSTRAINT `WorkoutType_workoutLogCode_fkey` FOREIGN KEY (`workoutLogCode`) REFERENCES `WorkoutLog`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WorkoutPerformance` ADD CONSTRAINT `WorkoutPerformance_workoutTypeCode_fkey` FOREIGN KEY (`workoutTypeCode`) REFERENCES `WorkoutType`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;
