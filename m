Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0064E7CF16
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577801; cv=none; b=ZaQdteKdMD6uhnR//hrWc/k/dxe9ZqvjZiVU0XurSxnlK9lewVjjsWGGd4e+CRrjXmYGUG0A4D5fyevi+Xq7lwcBQPcAaZfws8DPfcVKl/Mc86e2JqAyZvQ+QsyeLTYXVL7B6ZnaigBk4ohcAV3MdsFd+0nM3XBGeXfrz90qjZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577801; c=relaxed/simple;
	bh=CIEabKLwQYFi5rWVG64RsxgpPhddtq04bXOdegmdaRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=srpZBo8ytrwKM+2pHmbel2jWeJMonkmXO7wJYngls8BvuUcad+nUXnuhyd0YEHdzAxWi+AjKbmprEyVshxMNJSQfUGf+H89LqymSd6Tatq3v6YYe2AeDOkh8duhqjTw0S5QRbqjJVeFtMMsBD6KqQEwfrNP7uDaKWCzFtDZGcJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BztO6thK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BztO6thK"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220ecbdb4c2so38173815ad.3
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577799; x=1740182599; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ycy+7wK55n2BwKAQm8/kS9AwdfvEsdhnbKKp04wJVgI=;
        b=BztO6thKDUXlTlG0XK3g6wi9nU4VpAKez0bR3i3kfPZ8gLO4mx5g/JE2Oi35B9FwoL
         1z8YEyJijx6UHANwbYWiMcKBCRpvPrtLRfCq051O5g6txHppPxGzN9EW4iTlhzeVc90n
         L/oCHnFCuPOKI1Evimj5xUABnhjN5J2U+PpaoqJWtZZ4Dd3qeD8TIgyacAso1rhAqKNo
         XpXxN87NG/SN0cUvfHoU6TM7vQX6xRWm58D/Dh3Dw6NWCjhm0SDDEVTOwnHknZTRtNiZ
         3S4ycwDxUckcLI+B4Fh/ipjQkaXAOevFLv9vr8xTCFCH40JNKdZTvaIL+hSeUf0WtbZE
         sUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577799; x=1740182599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ycy+7wK55n2BwKAQm8/kS9AwdfvEsdhnbKKp04wJVgI=;
        b=kSU20RksVQtz7a/QaEHNouhI59n2rp0+3v25GnsIg+RPe8375Pguj0pKXW1JXzhhg2
         SxGnZWX2kt5YzpSVPJrcrTAoTy7y+v5hzCKCcwppCStXWpnJA4wChfUkUMY6XQjTQiuT
         MZmJnHEn0fvb9oJAS0NfoarLaLyYk7KK2KP5DaiTGIq8zlCg/EqkDsU0kJLy6e4WA+3Y
         CGI/YExdHTlDTK1UCnnrnMV8xoCkqPYt6nJhzbw2GBUPb9WgVBpc7vevJYL+G4wJOyxN
         ikHOkFFjOUNa6jgv9NpmstNSBghIcFpM1V6iJrggBPoCPukAq92mNSMcxNKsHK/TMYUb
         ySUA==
X-Forwarded-Encrypted: i=1; AJvYcCXzlrKhuIyhhBcPfjvMVYSQnyQNb7XlkSQFk6eLyopJAg4OhizO2eJbQeatLacwCzZIuPCH/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSnvnteAnsZ7hrFXoyZB+93q6qh5uO9Q/QAiK7wRgb1t+Erbgx
	pAp0bWJvAwsosFPN6LVFyMb7v4GkFNbaqXNYA90VoBb1Anoz0oOg
X-Gm-Gg: ASbGncs3JTZbxwahRhtAkqqyQGD73nB7bHw0xzHZRtMFa3pXvxX6PcbVFqnFwF2Kzfr
	LKCZdOtyE62Hls3qA1e/pM9wVr2zhVvhnc/wsO0F4Mauz25L8Ak4KvK8bEGdhE5gq7v6kJ85G+X
	6hYvKMGXysUyiqqbIoNrAMOubS8hoD6kZFrPSaKnq0/Zqm00R8yGXjH6Rs+AINnWQcE78ieWzBX
	p3Ng2aRWWiBMF5UgAwClU6zbGYMbIe+lH89q/IJEbl83oLoHGZwAKMP9IHBvDnnk8rwGq7924Ng
	oQhvzI3ZjdRdoFtB2pkkuq0Hj32kHml0Y0GGIULWn/zMzOnTbUUjwkeM8zgUjg1sipzSatDNKes
	FJQGKzXq0YQ==
X-Google-Smtp-Source: AGHT+IEQm7tez2sFvaRnjwzh7kSHWcuD4/AClFoJ/jh+RwdHvWH7dcB1tkblv6tQ6+TIuQ9PaI+aIQ==
X-Received: by 2002:a17:903:2341:b0:21a:8d8c:450d with SMTP id d9443c01a7336-221040d11e4mr18863625ad.53.1739577799290;
        Fri, 14 Feb 2025 16:03:19 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:03:18 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:34 +1000
Subject: [PATCH 01/27] ASoC: dt-bindings: tas27xx: add compatible for
 SN012776
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-1-723569b21b19@gmail.com>
References: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
In-Reply-To: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=CIEabKLwQYFi5rWVG64RsxgpPhddtq04bXOdegmdaRY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb24xXsK/dc2f4GcLfycVX/oQqmQ3y39WUYHQ91+98
 9+6apUpdpSyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjCRG54M/5MXt1c+rym55Xun
 fIk7m3dq2X/RBTtLWKSKNlqWv/p0s4OR4dqbFAPZrcvu8m3bxNDsIFPcbRdRbPvmwNNXixs93xZ
 mcAAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The TI SN012776 is a variant of TAS2764 found in Apple Silicon Macs.
It continues Apple's long-standing policy of getting vendors to
spin out subtly incompatible and Apple-exclusive variants of their
publicly available parts.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/ti,tas27xx.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml b/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
index 5447482179c14ee78885e5bee02f4549428694a6..fcaae848e78a1137e4d44f98258207bba68772b9 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
@@ -24,6 +24,7 @@ properties:
     enum:
       - ti,tas2764
       - ti,tas2780
+      - ti,sn012776 # Apple variant of TAS2764
 
   reg:
     maxItems: 1

-- 
2.48.1

