Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B77C47668D
	for <asahi@lists.linux.dev>; Wed, 12 Aug 2026 15:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548873; cv=none; b=RsB3+mCePHARYtJBh+tVjaKHj0nXyTlwnve2zjsJFmroQ6z9dgbYEdvJj1n6z6GUEEu22rkQ3UqMqKvvFzbvioSWKQ4nyoFjM5uqtMPNLEyLjQvWzQRwesOsSSJcv9mUT82RQtCOz9SJSxmi+Hjve0XQ+VcWkCT7rBYhXE5joA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548873; c=relaxed/simple;
	bh=BW+pwps1I6hyIq4fVhrPN0rElN20jmXdCuok9i3T7S8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6zZcC/5+5q5Lls1qYv3TT8ynYkk2tYaYd+4HLInKBo4SGJLGrqGSkbEH8e+hb15Hn7xo8LeupeSrPHNeoTjIOr9BA+1IaRbVIKPT4YWJKq95pJGsLyGhbsDIIrSeCWEkEyNjv6rc/1zHI3wzRY4HkXN7IxBeZ8fi01CjMvcnlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrADCnE6; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrADCnE6"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1129286a91.0
        for <asahi@lists.linux.dev>; Wed, 12 Aug 2026 08:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786548866; x=1787153666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jMN3WBwV3KB4v9bEDXkBGlhmHx1HUQvcapjqufTDqM=;
        b=RrADCnE6yDlVrqkHIo6Z1R6Ww6Y9pO7r0YoElhsGHlx9mguPKX9RI+Q6P6j+6QrTLH
         +L6SGyoAzdIJlmQ+7aWjH0vYHH8zHMVTZmD4ehsZ5yG6eQbdEpn6K/WNXM0/Sa6CQz08
         f694u53qcoIwtz2w92zZ8LR4Utlqop/ITiaXZsddC87XPm65S/zW2nDz1LskwQkcRn2F
         foG3OneUKlPRlI0p76Pbq208vgccAir7z71dA/vI60tOUFbSWldoPaiSOwn+mdVELGVm
         /oXK7/mXqdLPVWq2TjlBMmbplvajJe5krCMBswsC+W0mk7B43x/B9PhRFrYkkSuhNKlh
         loXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548866; x=1787153666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jMN3WBwV3KB4v9bEDXkBGlhmHx1HUQvcapjqufTDqM=;
        b=RSSzmLqJ3EASHR7RFO25/ck+CuXBMUK46mroOGqw4zqYbudEvBw1OfbBe9hwa8vACq
         GwLyAdVKjgD6Cm29stQaVGa7KvJ8/bWIHijOoYBN2mYhdfgMmp046gRxWIqYq0ooD/OM
         9owrHoDhEYvmtCN84hBdZwHPaJVbeXHbzAVaaLR4UtPGWlgZnjo5r1KIDnKoR8fU23iI
         LyOyLHaMAF5hOThwCiuYIxpDF3cvS0lvlj5xCdMYVwKaOun/yoOO7sgc/UezIT4okW3y
         UeRmGC5sKWOERfch0D5IbEcLIeGBsNqPm+M5Uyzoh5Fxu706dpJEd/gEIDG3tO4MesEa
         ssoA==
X-Forwarded-Encrypted: i=1; AHgh+RpV/k9swouirCeZH9/06hwMwR8FVD5xs6iBcqNCIaTQnqFRFeZ/cVdmhpmNQ5i0UL91n3SOLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxE+eYg03JKUgLea0DJhDfYFSlljjfeoIxBmduBE52UAXm7y2me
	BkAffmw06Qe6FekfGK8ZAkHo9RGALgsruoGKJn5rKlLWfvLKPTSQ/AQ=
X-Gm-Gg: AR+sD12p8gzGzYADJUi6opYSyFrTq4kd/+ri1utBAYVNLT7NYKy3IYr58Po1927S51m
	67JwFg71tLRTZFbLJrw8F9ocJxX9GaB5sJXu/qLhBFRALn7bX09XssScOzxy9qv9R/wgPMFc061
	jSBoRGW8fRL7ayS9Kd6Rzh8cGVysJ2j8PeZE4EHqVs5h6GYNkkkn0OGpxD9osh2tOoca1dmGFlj
	OPU/kll8765n4dkVpOgblwbGMMFq+HItgtIcrqkzx2BIhBPs2tGKDfJzySXZt/sWTP8lIuGY/Xc
	ApA7XFgxKp+wfJBiTs7j64DrCWRP6w/mlinBk6FaaEfJ4t+hOkYBFNkibpVYMCAcUU4PmzNTL5E
	V8iJCU+dgrhH2MGq5a+iZYXxX0a8Q8gnoIJtVJF8qxKvX4BgZEjmyxucfQtTK2kulQF8lksYwY5
	sI3oC6d0fiuJn3vqQVto4LHmL613YAKINfCsebi+kJazO77Pd6wcRBArX7xfS1VoxV9oqTLPZ9x
	l1QmIXi5O+zn6gQos16PBHd
X-Received: by 2002:a17:90b:580b:b0:381:28e0:6259 with SMTP id 98e67ed59e1d1-39301490293mr7234944a91.9.1786548865759;
        Wed, 12 Aug 2026 08:34:25 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([14.97.72.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31dba3e9791sm7160804eec.0.2026.08.12.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:34:25 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Sebastian Reichel <sre@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] debug
Date: Wed, 12 Aug 2026 11:34:06 -0400
Message-ID: <20260812153411.1159-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/acpi/sbshc.c                | 11 +++++++++--
 drivers/power/supply/macsmc-power.c |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/sbshc.c b/drivers/acpi/sbshc.c
index 6bf5c5de5b89..a919be8bff05 100644
--- a/drivers/acpi/sbshc.c
+++ b/drivers/acpi/sbshc.c
@@ -207,6 +207,7 @@ int acpi_smbus_register_callback_global(smbus_alarm_callback callback, void *con
 
 	struct acpi_smb_hc *hc = READ_ONCE(global_hc);
 
+	pr_warn("registered callback\n");
 	mutex_lock(&hc->lock);
 	hc->callback = callback;
 	hc->context = context;
@@ -233,6 +234,7 @@ EXPORT_SYMBOL_GPL(acpi_smbus_unregister_callback_global);
 
 static inline void acpi_smbus_callback(void *context)
 {
+	pr_warn("acpi_smbus_callback\n");
 	struct acpi_smb_hc *hc = context;
 	if (hc->callback)
 		hc->callback(hc->context);
@@ -243,15 +245,20 @@ static int smbus_alarm(void *context)
 	struct acpi_smb_hc *hc = context;
 	union acpi_smb_status status;
 	u8 address;
-	if (smb_hc_read(hc, ACPI_SMB_STATUS, &status.raw))
+	pr_warn("smbus_alarm called\n");
+	if (smb_hc_read(hc, ACPI_SMB_STATUS, &status.raw)) {
+		pr_err("smbus_alarm: cant read status\n");
 		return 0;
+	}
 	/* Check if it is only a completion notify */
 	if (status.fields.done && status.fields.status == SMBUS_OK) {
 		hc->done = true;
 		wake_up(&hc->wait);
 	}
-	if (!status.fields.alarm)
+	if (!status.fields.alarm) {
+		pr_err("no alarm\n");
 		return 0;
+	}
 	mutex_lock(&hc->lock);
 	smb_hc_read(hc, ACPI_SMB_ALARM_ADDRESS, &address);
 	status.fields.alarm = 0;
diff --git a/drivers/power/supply/macsmc-power.c b/drivers/power/supply/macsmc-power.c
index d4614fd728c5..8fb3694ddc58 100644
--- a/drivers/power/supply/macsmc-power.c
+++ b/drivers/power/supply/macsmc-power.c
@@ -927,6 +927,8 @@ static void macsmc_power_acpi_callback(void *context)
 {
 	struct macsmc_power *power = context;
 
+	dev_warn(power->dev, "got interrupt\n");
+
 	power_supply_changed(power->batt);
 	power_supply_changed(power->ac);
 }
-- 
2.43.0

