/*
  Warnings:

  - You are about to drop the `MappingComment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MappingFile` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MappingGym` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MappingRestaurant` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `WorkoutLog` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `WorkoutPerformance` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `WorkoutType` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `MappingComment` DROP FOREIGN KEY `MappingComment_mappingCode_fkey`;

-- DropForeignKey
ALTER TABLE `MappingComment` DROP FOREIGN KEY `MappingComment_userCode_fkey`;

-- DropForeignKey
ALTER TABLE `MappingFile` DROP FOREIGN KEY `MappingFile_timeStamp_fkey`;

-- DropForeignKey
ALTER TABLE `MappingGym` DROP FOREIGN KEY `MappingGym_mappingCode_fkey`;

-- DropForeignKey
ALTER TABLE `MappingRestaurant` DROP FOREIGN KEY `MappingRestaurant_mappingCode_fkey`;

-- DropForeignKey
ALTER TABLE `WorkoutLog` DROP FOREIGN KEY `WorkoutLog_userCode_fkey`;

-- DropForeignKey
ALTER TABLE `WorkoutPerformance` DROP FOREIGN KEY `WorkoutPerformance_workoutTypeCode_fkey`;

-- DropForeignKey
ALTER TABLE `WorkoutType` DROP FOREIGN KEY `WorkoutType_workoutLogCode_fkey`;

-- DropTable
DROP TABLE `MappingComment`;

-- DropTable
DROP TABLE `MappingFile`;

-- DropTable
DROP TABLE `MappingGym`;

-- DropTable
DROP TABLE `MappingRestaurant`;

-- DropTable
DROP TABLE `WorkoutLog`;

-- DropTable
DROP TABLE `WorkoutPerformance`;

-- DropTable
DROP TABLE `WorkoutType`;
