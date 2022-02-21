-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` VARCHAR(191) NOT NULL,
    `userName` VARCHAR(191) NOT NULL,
    `userPassword` VARCHAR(191) NOT NULL,
    `userType` VARCHAR(191) NOT NULL,
    `userAgree` BOOLEAN NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `User_userId_key`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Mapping` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `timeStamp` VARCHAR(191) NOT NULL,
    `mappingType` VARCHAR(191) NOT NULL,
    `mappingName` VARCHAR(191) NOT NULL,
    `mappingTel` VARCHAR(191) NOT NULL,
    `mappingBusinessHour` VARCHAR(191) NOT NULL,
    `mappingMuscleUp` INTEGER NOT NULL,
    `mappingMuscleDown` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Mapping_timeStamp_key`(`timeStamp`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MappingRestaurant` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mappingId` INTEGER NOT NULL,
    `restaurantMenu` VARCHAR(191) NOT NULL,
    `restaurantNutrition` VARCHAR(191) NOT NULL,
    `restaurantTip` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `MappingRestaurant_mappingId_key`(`mappingId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MappingGym` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mappingId` INTEGER NOT NULL,
    `gymFacility` VARCHAR(191) NOT NULL,
    `gymMood` VARCHAR(191) NOT NULL,
    `gymGood` VARCHAR(191) NOT NULL,
    `gymBad` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `MappingGym_mappingId_key`(`mappingId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MappingComment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `mappingId` INTEGER NOT NULL,
    `commentContent` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `MappingComment_mappingId_key`(`mappingId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MappingFile` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `timeStamp` VARCHAR(191) NOT NULL,
    `imgSrc` VARCHAR(191) NOT NULL,
    `imgName` VARCHAR(191) NOT NULL,
    `imgType` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WorkoutLog` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WorkoutType` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `workoutLogId` INTEGER NOT NULL,
    `workoutName` VARCHAR(191) NOT NULL,
    `workoutComment` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `WorkoutPerformance` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `workoutTypeId` INTEGER NOT NULL,
    `workoutSet` INTEGER NOT NULL,
    `workoutCount` INTEGER NOT NULL,
    `workoutWeight` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Mapping` ADD CONSTRAINT `Mapping_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MappingRestaurant` ADD CONSTRAINT `MappingRestaurant_mappingId_fkey` FOREIGN KEY (`mappingId`) REFERENCES `Mapping`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MappingGym` ADD CONSTRAINT `MappingGym_mappingId_fkey` FOREIGN KEY (`mappingId`) REFERENCES `Mapping`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MappingComment` ADD CONSTRAINT `MappingComment_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MappingComment` ADD CONSTRAINT `MappingComment_mappingId_fkey` FOREIGN KEY (`mappingId`) REFERENCES `Mapping`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MappingFile` ADD CONSTRAINT `MappingFile_timeStamp_fkey` FOREIGN KEY (`timeStamp`) REFERENCES `Mapping`(`timeStamp`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WorkoutLog` ADD CONSTRAINT `WorkoutLog_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WorkoutType` ADD CONSTRAINT `WorkoutType_workoutLogId_fkey` FOREIGN KEY (`workoutLogId`) REFERENCES `WorkoutLog`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WorkoutPerformance` ADD CONSTRAINT `WorkoutPerformance_workoutTypeId_fkey` FOREIGN KEY (`workoutTypeId`) REFERENCES `WorkoutType`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
