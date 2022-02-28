/*
  Warnings:

  - A unique constraint covering the columns `[mappingLatitude]` on the table `Mapping` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[mappingLongitude]` on the table `Mapping` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `mappingLatitude` to the `Mapping` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mappingLongitude` to the `Mapping` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Mapping` ADD COLUMN `mappingLatitude` VARCHAR(191) NOT NULL,
    ADD COLUMN `mappingLongitude` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Mapping_mappingLatitude_key` ON `Mapping`(`mappingLatitude`);

-- CreateIndex
CREATE UNIQUE INDEX `Mapping_mappingLongitude_key` ON `Mapping`(`mappingLongitude`);
