Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65474136358
	for <asahi@lists.linux.dev>; Sat, 25 Apr 2026 00:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777077867; cv=none; b=X/H7IEvxAd/VneJxI7WvPm3nzkWNoOUDzZPoB482j70KkDtIlEcPoxJSi/FfvGVnVUdsJbQ8UIDteOf4PZ8H27JopvSsWL0dTUxPUBalg9UtT3wx7ZrcO18HoG++KnoTqs5CcZz0ohzX3AfgeH+q4C92A6mHUGNOzJ2FoFLdIS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777077867; c=relaxed/simple;
	bh=OM3g9FtTD35pKvRKldl4QuwFBMFj0CM7U9jz3AYWiF4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NWP4a90W6IaUM1cLERUiQuR4mesdZZBhIXbdcsq/2ZQ9kul6zE8nh9a6bZSoizRus12qtB6exzJyXrlFOwkOwPgRgGPKvIStTDk3wJnyDimICZQwDs0UCc3OtzgnjMuI8iPxHsT4PjSWDyJVFbA1MRIPm3fBYJsGiuB3VpZWIS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdiNqM6L; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdiNqM6L"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so4827846b3a.1
        for <asahi@lists.linux.dev>; Fri, 24 Apr 2026 17:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777077866; x=1777682666; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXELO0KaVcDm5nDbpYvDIqJfkxikSAl12jvPRMM61W0=;
        b=fdiNqM6LIXk8IMIeF+zTOTSRjqZHIyAT4cCwj1nR3PlDwsZOHTpVOySIYJ/utt0kIg
         CloloJO0HY1mRBYI1epaj/u3eYx2A5PXpbLixZ/fOw+QdQEvqcwkmeufHvf6eBA9vnm9
         wMmkzj+BPpll5U8pthZNLiQi5q+PPkC5HgAlEk9bt60wKzSgD6GdQ7xuawIXxUHOCLOG
         XX83/JLxsIshA2wERVLArWi3iq04DmCCHinEqPMcHahv9UqH/n1BxSBTKkSnM8kSUNlI
         YGIjROUvygzSdXx2/D01ijhPiyV6ek5QBNtG6HrUK0qqh3AORjL/WheEOFJHuV2l7hK5
         FWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777077866; x=1777682666;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXELO0KaVcDm5nDbpYvDIqJfkxikSAl12jvPRMM61W0=;
        b=eSW+/Enven1VrFTiOeS+UDOTBOW5Z5anaNI/2eIAF7tAecjCjBiCDjkzMxjJPpgc8h
         jO4Q7jyMnLkktOzNwKAArW3WmUeqCMBnwNtmrj271hmRsGXQRBJ2NG6ISsN5Jjj4lKtO
         XipM5OsRB1RuBckflIGZYTTWKz6xP1trtm5BumtjxEGArSJfljhEGG2FthpIV2SCVB9t
         jLujwEAXvxhJmVAARDKSLKRNDfJodSnZWtSPWkkWr8bZ2VoEGVObxM/3WLqkR4fy6jaD
         dIXg/TpsBXccz9mjr18KcEsNGLoM8xuLMjJ3RfvhhglxcO+cTKf3g73XnccJC0j2ADL/
         J1iw==
X-Forwarded-Encrypted: i=1; AFNElJ9HU12YTFvteBJS+c5L4Fib/rx+60gDTh0pfTDrZBl7yaeLg/Y5Q+3G/Fa6XAK1SeEztCix7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvjA/R4bmIjnXBlPbN3MzHqvEf7+2Q7G0LG3pqH9WR9OE0A9d/
	EcGiOzc7xi4yUshfx4vbvfCqRE8NOuQLor/WLO2lQXvVGxEAHdQlaX34
X-Gm-Gg: AeBDievkZ50Xjp/xmqMMWX5EWLWIUNLIr2psmf9FS/D844IppqPkG9srMPxytAP9yQs
	jNL1uiaykAG91S4ijluPmhJhbOEbyz1ZhvsgeTOtqgfLmPOY8nW9RPlwL0crj5eLg540tR2oYMo
	B+2XvWbAx3FqFIAqET0W34ko+1NWGNCJ7BSgMSsDE+y7vYTVwZzUhKPUZGPxK4NctGNGCfBRmVt
	yYsIh3YImHGw1Ta+GwDSEKF658HmJr9oL5HmpvtOyQdH2pQUSGWbz+qA8f06dW4GYVubxT99HeK
	3GvxRcLMV6fVUsEAJnnFpkw7dd+kxDu4CoLWltrB9/IXJHpEbiKUUBKmccHE3QJtZp3A72XJ8Rd
	BU3CrWm95nZ+1HF/ndE8wjr2BQHEWb/bkCx8XEwp6bfNuNSxbo5S2y1fAntZTKzJ+MIfjrPK9E3
	E8iUQAn+yNhhPyrW+Q1Ufkke08dmzIOBFRoMmcE9FyiYgyMWaCKOxiVvt91SWS+ehPGvqvs42ny
	t5yxQrDjwa6XuDR3NVdeyOzxNr5VutHQhqFiGNhR4tCzHzA7kHSfA2Q8hV6/fWQ7vamC8xyuACu
	3i6ZMZrXgQ==
X-Received: by 2002:a05:6a00:8715:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-82fa89ee99fmr18683408b3a.14.1777077865744;
        Fri, 24 Apr 2026 17:44:25 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0566dsm24948385b3a.57.2026.04.24.17.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 17:44:25 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/4] ASoC: tas27{64,70}: Fixes for hwmon temperature
 readout
Date: Sat, 25 Apr 2026 10:44:02 +1000
Message-Id: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIO7GkC/yXMywqDMBCF4VeRWXcgBuPtVUoXNh11BKNkrAbEd
 zfq8uPwnx2EPJNAnezgaWXhyUWkrwRs37iOkH/RoJXOVaYNLo3oIgTst3Fy2HIgwdaWJlNUppV
 REMvZ0z3E8P15LP/vQHa5ruA4TkXOikx3AAAA
X-Change-ID: 20260425-tas27xx-hwmon-fixes-fc8540e81950
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=OM3g9FtTD35pKvRKldl4QuwFBMFj0CM7U9jz3AYWiF4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJlv+FKkN2d9adi0KMv8sOY5lm1Wjd8bX8bmMh/68Wdtz
 fff08q3d0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTGBDRBoYgICFgS83Ma/USMdIz1TbUM/Q
 SMdYx4iBi1MApjpRnJFh5cGJb3V2ZJx7avnKNc7o0t5L3i4KrbvnnzJ85+vxn2vXaUaGf6eF026
 stLzg/f/k6SsZtgvdDK9JrPy8Tku/9OO1mvcl/AA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

This series makes some fixes to the hwmon temperature reading
functionality added as part of [1].

- The arithmetic for TAS2770 was incorrect, leading to readings
  which deviated from the true value sampled by the ADC.
- TAS2764 was returning the cached value for each read after the
  first register sampling.
- Both chips were returning nonsense values before the ADC was
  fully powered up, causing issues with some monitoring software.

Regards,
James

[1]: https://lore.kernel.org/all/20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com/

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
James Calligeros (4):
      ASoC: tas2764: Mark die temp register as volatile
      ASoC: tas2764: Deal with bogus initial temperature register value
      ASoC: tas2770: Fix order of operations for temperature calculation
      ASoC: tas2770: Deal with bogus initial temperature value

 sound/soc/codecs/tas2764.c | 22 ++++++++++++++--------
 sound/soc/codecs/tas2770.c | 13 ++++++++++---
 2 files changed, 24 insertions(+), 11 deletions(-)
---
base-commit: 7a69564045595263837fbd57e9f67e0507b04d8c
change-id: 20260425-tas27xx-hwmon-fixes-fc8540e81950

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

