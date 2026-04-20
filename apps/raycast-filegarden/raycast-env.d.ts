/// <reference types="@raycast/api">

/* 🚧 🚧 🚧
 * This file is auto-generated from the extension's manifest.
 * Do not modify manually. Instead, update the `package.json` file.
 * 🚧 🚧 🚧 */

/* eslint-disable @typescript-eslint/ban-types */

type ExtensionPreferences = {
  /** Email - Your FileGarden email */
  "email": string,
  /** Password - Your FileGarden password */
  "password": string,
  /** Screenshots Folder ID - The ID of the folder where screenshots will be uploaded */
  "screenshotsFolderId"?: string
}

/** Preferences accessible in all the extension's commands */
declare type Preferences = ExtensionPreferences

declare namespace Preferences {
  /** Preferences accessible in the `screenshot` command */
  export type Screenshot = ExtensionPreferences & {}
  /** Preferences accessible in the `browse` command */
  export type Browse = ExtensionPreferences & {}
}

declare namespace Arguments {
  /** Arguments passed to the `screenshot` command */
  export type Screenshot = {}
  /** Arguments passed to the `browse` command */
  export type Browse = {}
}

