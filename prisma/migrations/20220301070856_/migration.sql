/*
  Warnings:

  - The primary key for the `Mapping` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Mapping` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Mapping` table. All the data in the column will be lost.
  - The primary key for the `MappingComment` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `MappingComment` table. All the data in the column will be lost.
  - You are about to drop the column `mappingId` on the `MappingComment` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `MappingComment` table. All the data in the column will be lost.
  - The primary key for the `MappingFile` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `MappingFile` table. All the data in the column will be lost.
  - The primary key for the `MappingGym` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `MappingGym` table. All the data in the column will be lost.
  - You are about to drop the column `mappingId` on the `MappingGym` table. All the data in the column will be lost.
  - The primary key for the `MappingRestaurant` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `MappingRestaurant` table. All the data in the column will be lost.
  - You are about to drop the column `mappingId` on the `MappingRestaurant` table. All the data in the column will be lost.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `User` table. All the data in the column will be lost.
  - The primary key for the `WorkoutLog` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `WorkoutLog` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `WorkoutLog` table. All the data in the column will be lost.
  - The primary key for the `WorkoutPerformance` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `WorkoutPerformance` table. All the data in the column will be lost.
  - You are about to drop the column `workoutTypeId` on the `WorkoutPerformance` table. All the data in the column will be lost.
  - The primary key for the `WorkoutType` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `WorkoutType` table. All the data in the column will be lost.
  - You are about to drop the column `workoutLogId` on the `WorkoutType` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[mappingCode]` on the table `MappingComment` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[mappingCode]` on the table `MappingGym` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[mappingCode]` on the table `MappingRestaurant` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userCode` to the `Mapping` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mappingCode` to the `MappingComment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userCode` to the `MappingComment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mappingCode` to the `MappingGym` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mappingCode` to the `MappingRestaurant` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userCode` to the `WorkoutLog` table without a default value. This is not possible if the table is not empty.
  - Added the required column `workoutTypeCode` to the `WorkoutPerformance` table without a default value. This is not possible if the table is not empty.
  - Added the required column `workoutLogCode` to the `WorkoutType` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Mapping` DROP FOREIGN KEY `Mapping_userId_fkey`;

-- DropForeignKey
ALTER TABLE `MappingComment` DROP FOREIGN KEY `MappingComment_mappingId_fkey`;

-- DropForeignKey
ALTER TABLE `MappingComment` DROP FOREIGN KEY `MappingComment_userId_fkey`;

-- DropForeignKey
ALTER TABLE `MappingGym` DROP FOREIGN KEY `MappingGym_mappingId_fkey`;

-- DropForeignKey
ALTER TABLE `MappingRestaurant` DROP FOREIGN KEY `MappingRestaurant_mappingId_fkey`;

-- DropForeignKey
ALTER TABLE `WorkoutLog` DROP FOREIGN KEY `WorkoutLog_userId_fkey`;

-- DropForeignKey
ALTER TABLE `WorkoutPerformance` DROP FOREIGN KEY `WorkoutPerformance_workoutTypeId_fkey`;

-- DropForeignKey
ALTER TABLE `WorkoutType` DROP FOREIGN KEY `WorkoutType_workoutLogId_fkey`;

-- AlterTable
ALTER TABLE `Mapping` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `userId`,
    ADD COLUMN `code` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `userCode` INTEGER NOT NULL,
    ADD PRIMARY KEY (`code`);

-- AlterTable
ALTER TABLE `MappingComment` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `mappingId`,
    DROP COLUMN `userId`,
    ADD COLUMN `code` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `mappingCode` INTEGER NOT NULL,
    ADD COLUMN `userCode` INTEGER NOT NULL,
    ADD PRIMARY KEY (`code`);

-- AlterTable
ALTER TABLE `MappingFile` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    ADD COLUMN `code` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`code`);

-- AlterTable
ALTER TABLE `MappingGym` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `mappingId`,
    ADD COLUMN `code` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `mappingCode` INTEGER NOT NULL,
    ADD PRIMARY KEY (`code`);

-- AlterTable
ALTER TABLE `MappingRestaurant` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `mappingId`,
    ADD COLUMN `code` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `mappingCode` INTEGER NOT NULL,
    ADD PRIMARY KEY (`code`);

-- AlterTable
ALTER TABLE `User` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    ADD COLUMN `code` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`code`);

-- AlterTable
ALTER TABLE `WorkoutLog` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `userId`,
    ADD COLUMN `code` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `userCode` INTEGER NOT NULL,
    ADD PRIMARY KEY (`code`);

-- AlterTable
ALTER TABLE `WorkoutPerformance` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `workoutTypeId`,
    ADD COLUMN `code` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `workoutTypeCode` INTEGER NOT NULL,
    ADD PRIMARY KEY (`code`);

-- AlterTable
ALTER TABLE `WorkoutType` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    DROP COLUMN `workoutLogId`,
    ADD COLUMN `code` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `workoutLogCode` INTEGER NOT NULL,
    ADD PRIMARY KEY (`code`);

-- CreateIndex
CREATE UNIQUE INDEX `MappingComment_mappingCode_key` ON `MappingComment`(`mappingCode`);

-- CreateIndex
CREATE UNIQUE INDEX `MappingGym_mappingCode_key` ON `MappingGym`(`mappingCode`);

-- CreateIndex
CREATE UNIQUE INDEX `MappingRestaurant_mappingCode_key` ON `MappingRestaurant`(`mappingCode`);

-- AddForeignKey
ALTER TABLE `Mapping` ADD CONSTRAINT `Mapping_userCode_fkey` FOREIGN KEY (`userCode`) REFERENCES `User`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MappingRestaurant` ADD CONSTRAINT `MappingRestaurant_mappingCode_fkey` FOREIGN KEY (`mappingCode`) REFERENCES `Mapping`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MappingGym` ADD CONSTRAINT `MappingGym_mappingCode_fkey` FOREIGN KEY (`mappingCode`) REFERENCES `Mapping`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MappingComment` ADD CONSTRAINT `MappingComment_userCode_fkey` FOREIGN KEY (`userCode`) REFERENCES `User`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MappingComment` ADD CONSTRAINT `MappingComment_mappingCode_fkey` FOREIGN KEY (`mappingCode`) REFERENCES `Mapping`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WorkoutLog` ADD CONSTRAINT `WorkoutLog_userCode_fkey` FOREIGN KEY (`userCode`) REFERENCES `User`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WorkoutType` ADD CONSTRAINT `WorkoutType_workoutLogCode_fkey` FOREIGN KEY (`workoutLogCode`) REFERENCES `WorkoutLog`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `WorkoutPerformance` ADD CONSTRAINT `WorkoutPerformance_workoutTypeCode_fkey` FOREIGN KEY (`workoutTypeCode`) REFERENCES `WorkoutType`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;
