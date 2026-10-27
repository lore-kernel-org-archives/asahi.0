Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139195;
	b=ivwxWErcMFhunEca/rFmRwfHdK8DWw3x7yqwSWkdg47106CwZXwtiR6CtOX9BfUkMmIJ
	 jzgu5r6S92riX/FSGU0YTsFn7/b6UtuMbYXXk8OFFrGNKA//vPZ6Edu/1ZtrEZAMyHSOu
	 lYxUtivEBryCwLWMhSCLJOOabD8RCvwfO+zqE7CxxmMCTPR59jqds6HbfnOvFFLO109Gi
	 DwY8nmLBtJ+qsAjQrKt+fTvJuy/tbipPwe1B9FrDNYePNdzPW2Pk9vMNVZ8cBJgdwds9e
	 UjYwdYTfLzjZXLI40VmmG6UqiPRWcPqxT3lT/ZihDrQDFznkLweN/+SM332oRfGK9Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SF/2BCZg0521GRG2+QySkfLq2PA18MozDs+RfXA8UmI=;
	b=29YiRKrMUC09e40JwB0GoIZVvM99nIK1TNAw9rweGV/rIO7tqjplDkHb8QKp5D7XKyW7
	 Ju6aErjNRfUtSc324VxOdpWcrsp8hE6l3UWisxzdzUG/bK5dCGD6Cry0XoB1FkZNRKRDr
	 TAyExg5WL4Q1uLtENWa4Yq3H6dv7xh7z+kjxMicbT0EKQZnUnQ3zxZHYzsxAwPYTuPx9i
	 jE7BgeRao52fye8YpP8uQWzxUAsmvVSLcOPktPTsKu89avi+ZZIw7RGCa4j10t10BAFn3
	 k6dECV+kdHwPYV+LDo9JPydWaBZa6jccL5WpFwzQWXUrEohqJObsgN48yQ1Ewuz/y3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uPs4dkQr;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96159606A330
	for <asahi@lists.linux.dev>; Tue, 27 Oct 2026 22:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96159606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uPs4dkQr
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be416e603cso272460e87.2
        for <asahi@lists.linux.dev>; Tue, 27 Oct 2026 15:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793139193; x=1793743993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SF/2BCZg0521GRG2+QySkfLq2PA18MozDs+RfXA8UmI=;
        b=uPs4dkQr9tWUrquVYiPaw40WXILMHS2e4dJGfQIY8+PKXouXcCR1wznyQdw6vl61sA
         9kRokNGlgn09rFUZ+w4ixKzc2+wJ397SIWB2ORUyue87o3YeVNlynRoMnQ4wJ2AZJpx5
         N6BQ+OcT2+rI+COLdFLV4lcCnXN8wdlTrYNtFna01zpDXTtHCQ4IVtrqQKZ5CK85JH5p
         tjt7/KvbOCaoCdGV5jKguGb8si83Epg5cK6Vmp+19lz6C3LV+Co6xrOmKrqbqE9lpZ4f
         xJWdim9AJbQ730EOSBImyWg4jxjDVoTwP1AgsEqaYexLdjlbMherNfykg4KWhmkGEDoM
         eqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139193; x=1793743993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SF/2BCZg0521GRG2+QySkfLq2PA18MozDs+RfXA8UmI=;
        b=RGUqfAiaZP2/27KZGsyGgkFB2aloiu3C+YeRL34H30ncCKVgdcDxBfOYi89MvxYuCO
         kbbSRVInFLBxpKfH6pJTmkksYNXfWTzBpB2o6OUVFbz8/qFdH2V615SWg/LdESVnF0Uu
         cXrPlW/T7h3gE75koTe/3UxeEVPV4Y738yuaCGuF5SYlUocWcfeGaepn+4+VN7kkzPhL
         TggxB6zh57eiGejhyR81pe5ngFT1/PERXBYdTuWHA8BD2DsXWWgtkzNdJ9urZH77VBUF
         pFfkNPebNP7V/AWaKLKFqTO/Zm0HVmdCpA7SnNPNMPF6sjBX0u/tNV+1yy6xjIhzMyNz
         UePg==
X-Forwarded-Encrypted: i=1; AKwUvBx6Ten31grQJlORlvxkIk+IccxvEFtskhnuluULDr0ysTUPSubTrp5gEa2sAvp9d54Rxh6XGQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKKTlJa5dxOCcdzs9ZsxwWawEGMMWBEHNj/N8VTkID2AiESsiDw
	IrsLjBpyK5wDuQKSC82P6BxRHcp6siJ5VK/4vsVhA+aQcBuV7QIbl0AK
X-Gm-Gg: AYBFou2+mBVABkUy6XcQwWsLEyqLue38LgmBDFOx5z4Cw8zFhKav4vcMePB5OrWlyLn
	YjyAyHOl7QiSjLkUMKzP7+1jEmUOIPAR2JJ9w7TZILKD3gI55z0neeOQot07ErYgBlWI+zbwUDV
	4uCq9hOZqXzHUqokThRUTwKfUp+57IVnrT8jAaKTNh9vacy4ZX4ycjBsRWUb0JKe/K18wYubfwc
	R24JQna7Ya2k9hy0x6nqrqGq/cTW6d2DxLc5Cde2hYqc8tSfedt650/jo+si/nbSNihrLQbCw3V
	KGOtdOES5u6SGTjjh75bFKkPKb6o9W6NkHl8+7AnDfktd4wTzGLCiYGcQ5JRxACxxsM9qET/h/z
	tOBWAcxyT8vgnx2iHzF2pBgTZCC4QzcAtoDFqRnn7+6g+4akwXADnHzxkc5To76DKjzU1dqefwD
	PlJM09f/fWLAXKgrBATZyAnD83/3xYi2vTX9o2PZ9vmv4cq/8R3p7/U7pzoWT35snhq0PwYLrmH
	z7ZDBQ9WKbCgAdqZRXWfPyItzmiwl2IvFsBpV3reIg3sfGZRP0RiymltaC7pIX3xOCvqkCPamka
	ZKBCTXnsbXnGmk4tEXdyLTdMJNOIUSGZngd55YNIm40voE44QwqV
X-Received: by 2002:a05:6512:39d1:b0:5b7:f75a:ea68 with SMTP id 2adb3069b0e04-5bfcadc7276mr209189e87.35.1793139192453;
        Tue, 27 Oct 2026 15:13:12 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993a57sm27289281fa.12.2026.10.27.15.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:13:10 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] HID: apple: Map Fn+Esc to SysRq
Date: Wed, 28 Oct 2026 03:13:01 +0500
Message-ID: <20261027221301.296198-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple keyboards have no SysRq/Print Screen key, so nothing on them
reports KEY_SYSRQ and the magic SysRq key cannot be used from them
without a keymap change.

The documented way for keyboards without SysRq is to remap another key
to KEY_SYSRQ through the keymap (setkeycodes, EVIOCSKEYCODE, a udev
hwdb entry). Compact Apple keyboards have no unused key for that, so
the remap gives up a key. The free combinations are in the Fn layer,
which the keymap cannot reach: it is indexed by scancode, and Fn does
not change the scancode of the key pressed with it. Esc reports usage
0x70029 with and without Fn, so a keymap entry cannot tell Fn+Esc from
Esc.

hid-apple already implements the Fn layer and uses it to provide PC
keys that Apple keyboards lack: Fn+Backspace is Delete, Fn+Enter is
Insert, and Fn+arrow keys are Page Up, Page Down, Home and End. Add
SysRq to it as Fn+Esc, in the table used by the Magic Keyboard 2021 and
2024 models. No table in hid-apple translates Esc, so today Fn+Esc is
just a second Esc key.

The new entry has no flags, so like Fn+Enter it is translated only
while Fn is held, whether the top row defaults to media keys or to
function keys. Fn+Esc then reports KEY_SYSRQ, and the magic SysRq key
is Alt + Fn+Esc + command key.

Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
Tested on the internal keyboard of a MacBook Pro 16" (M1 Max) with the
Fedora Asahi Remix 7.1.13 kernel, where hid-apple handles that keyboard
with the same magic_keyboard_2021_and_2024_fn_keys table; the table is
identical to the one in mainline. In evtest, Esc alone still reports
KEY_ESC, and Fn+Esc reports KEY_SYSRQ on press and release, with the
Esc scancode 0x70029. Alt + Fn+Esc + H prints the SysRq help to the
kernel log. In mainline this table serves the Magic Keyboard 2021 and
2024 models over USB and Bluetooth; that path has not been tested on
hardware.

Background: this came up on linux-input in 2007 for an Apple USB
keyboard. A configurable SysRq keycode was proposed, and the advice was
to remap a key of that keyboard to KEY_SYSRQ instead, so that SysRq
keeps working with other keyboards [1]; that keyboard had a spare F13.
A generic alternative SysRq key was proposed again in 2021 and was not
merged; the objection was to adding a new SysRq key regardless of the
keyboard [2]. This patch leaves the sysrq code alone and makes the
keyboard itself report KEY_SYSRQ, on a Fn combination that has no other
function; Apple's list of macOS Fn shortcuts has none with Esc either
[3].

The same entry could also go into the other Apple tables for keyboards
with a physical Esc, for example older Magic Keyboards and the T2
MacBook Pro models with a dedicated Esc key. I kept this patch to the
table I could test.

If this is accepted, I will follow up with a line in
Documentation/admin-guide/sysrq.rst describing the combination.

[1] https://lore.kernel.org/linux-input/d120d5000707160541k64c40d0dgf661226806fd98c8@mail.gmail.com/
[2] https://lore.kernel.org/lkml/YYUxNaDG0DquQvke@kroah.com/T/
[3] https://support.apple.com/en-us/102650

 drivers/hid/hid-apple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 5b32fb8c77f3..b37964451a43 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -173,6 +173,7 @@ static const struct apple_key_translation magic_keyboard_2015_fn_keys[] = {
 static const struct apple_key_translation magic_keyboard_2021_and_2024_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
+	{ KEY_ESC,	KEY_SYSRQ },
 	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
 	{ KEY_F2,	KEY_BRIGHTNESSUP,   APPLE_FLAG_FKEY },
 	{ KEY_F3,	KEY_SCALE,          APPLE_FLAG_FKEY },
-- 
2.56.0

