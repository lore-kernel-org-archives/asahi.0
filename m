Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96453136358
	for <asahi@lists.linux.dev>; Sat, 25 Apr 2026 00:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777077872; cv=none; b=FVdjwAbBJHr6FIhhkE+xT6UFzA9R4T5pzItfOSsk3vQU0NmXBnVIsctoM7+cbKDKJ6khNg8BmXnO1tVnpYHNBxTQrnT+xBMlpf2RFYqAMEThm8qbBztKOWPrDrxeQUT8HhIFFG+i6IwLP6EkdbbBVpT6gnZ7Wi0FRnCGKb9TqDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777077872; c=relaxed/simple;
	bh=vbRWR4+e3gI1T28wrrTlg16+8udVjYCSiQQA8vBr/y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2v7XIYLV1nacvhE7G3ldRYlEGn3kZ55U9sn+gMdeg89ruUK2aUy0ylJ7ZQYnA+8JcTPVvoDO4n9XOxdk4BeSI2RpBwjPzfbSKhkKYU3ZqGf7xgkMkLVkZ6t5Ly9uwkzPuWEFawisRalSmYL53O/reNe76dObM1vj4BNuE64Rrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUV82w0H; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUV82w0H"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82f943870baso3440632b3a.1
        for <asahi@lists.linux.dev>; Fri, 24 Apr 2026 17:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777077871; x=1777682671; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xm2BMd5f70+IFDw9oIxnL0UFKMFjyAQAWO1QVmfPcuU=;
        b=iUV82w0H/fD8GcL+2pX0vSC4bU8+mpsKJNwrjQ4Hd2cKC4sunxA4gHiwrYcGLo01r2
         8b4g0H/YdfxG6HCDcrkfqLbWh2Wc33Eo+qBCcrcGt5CKB8hkBYporoDSpIqa1W52A7O5
         5CsLLC5TyG+OPV3DDqDvLr2M7R/mcN47kgeI5veLSn1WdMyF20viJoNMvqIJJrxEtRc2
         SHh0oZHGQtXCvFgFa3pExPhV5mAqg+m+6eqvpBAUOXmbFZynxLYvcV1YCKWPUqEg7f5P
         Y7NghPZ+cg3QfEWyiJSibQor/kFerucW+Bg7kLc/fO11qfjjF7DSykQn84gAic730WaI
         q0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777077871; x=1777682671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xm2BMd5f70+IFDw9oIxnL0UFKMFjyAQAWO1QVmfPcuU=;
        b=D7spk19YcCe4uRlkZXkDN22oozj4ykeFXYz3Bi/3nrJYgW3t72JiQW6XXwuCmnZ/xF
         MbRFkieTyRet9G3l6AQ+xsFFCf6nJdvne2OxRBnYM/bR//vqJp+BcQ3HOnsy4G4zdkPc
         8CCRnox/tdIklrqqZK5Cg8Z1HVEfZQnjkEdXNYNwnkqZczliMnMl/4o/rMDDkb+1gODC
         zcsLzRio9p8jbz40qlztIDs+DRFwxWWGorii/UfgpkWwew1sNjoc9EJbKeUQCTT3WMk2
         0zs5EAZ4R3oXdOI/BYWhUAk3Wh+dINliTd3ioJ+KckoRgL2dSlZO46KeXfaRdRqFUnLb
         ZM7w==
X-Forwarded-Encrypted: i=1; AFNElJ/+jqI3LaevzUkAY/szrSBsMEQu65CpuLnz4fpkvhnRHI1p58ARj3FAV1UkiS9DZqP2b5zlwg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrunu4Wi+Hz0lmSTag3NKgeJXmtMjrR6UDKIpiUbYLRooVtDBg
	uBqtOlULmqcdL2Kbpel/WsBnvIwNR19qcJq8x8Swz28CU/gYpqeDwuCw
X-Gm-Gg: AeBDiesZqoXXAJaNKphOLz1UXs79lER8dpUKBWPpvUwSL0x6Mh51qzA+inmD2pu0lzZ
	62bzRal2RoqmyV8RwSB5uqbUxYIpMYeeov8kU/LDG7AeKP2UjJiPqlkf1CYmiU/mVgWbv28hPEU
	IpjQ7zHOcPXngMRTkxwPi1PjmSy0EDAbHbEcIvyXpZYtaBi6EThA+3porVsTf99uUCk7AOliMRH
	jGchjS1plbFLs3iix3n9b/GXvrT23nOoUSsvesvHN30MJrHMEWsR2ZF96YwhtmpQCPJCPVubUbA
	yuNt+1IAmg1zK0JLXf5Kv5kuMQfKhDBWKHXmfYP08lDZDH9CPNOVeuAmvmNj1GM4BoxSnX5/7Sr
	wz7nCm1+5tAdlqugpDf2QBGUbiVUz8PhlIrNjL/22DYyETsICieAnqdUBqc6g7Rrc6zrBQjdVa1
	FUXoDnVEx9mBXwuOd8THGl4CQl6jrYEn4awac8qifqkuZO9QIxDVz8eKqxyBNnhPKUUL4nu5AN1
	llaEEN5IKopbWAGNuBZfKPHo0HkWL3nq5db1AnEQwE2mTYxR1QYfe1gjreRbf5XquOLS1muBxjj
	6Mr0+FQVtQ==
X-Received: by 2002:a05:6a00:2ea5:b0:82f:1973:4b96 with SMTP id d2e1a72fcca58-82f8c91bc71mr39302406b3a.26.1777077870896;
        Fri, 24 Apr 2026 17:44:30 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0566dsm24948385b3a.57.2026.04.24.17.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 17:44:30 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Apr 2026 10:44:03 +1000
Subject: [PATCH 1/4] ASoC: tas2764: Mark die temp register as volatile
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-tas27xx-hwmon-fixes-v1-1-83c13b8e8f54@gmail.com>
References: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
In-Reply-To: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=860;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=vbRWR4+e3gI1T28wrrTlg16+8udVjYCSiQQA8vBr/y0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJlv+FIO8OgtsTpy6fl1eTM17fYVx6732x49qbnbds6Ns
 qfr/2X/6ZjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1/QeGfya9zcf4bhUnWwR9eVKyctObv//izaf1et6xErC9x+fhKMvwv7qyXiz
 Jr3/HBtUJoh9WJBczTwnbcXV5toDw1xeaVS7xDAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Reading the temperature register always returns the first value
read from the chip due to regcache.

Mark TAS2764_TEMP as volatile to prevent returning stale, cached
values when reading the die temp.

Fixes: 186dfc85f9a8 ("ASoC: tas2764: expose die temp to hwmon")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 423b7073b302..6aab6d2b7419 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -904,6 +904,7 @@ static bool tas2764_volatile_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case TAS2764_SW_RST:
+	case TAS2764_TEMP:
 	case TAS2764_INT_LTCH0 ... TAS2764_INT_LTCH4:
 	case TAS2764_INT_CLK_CFG:
 		return true;

-- 
2.54.0

