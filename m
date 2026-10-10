Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D75225403
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791598817; cv=none; b=YjZk3zNOI/xFBn6vX9qxARw/h03Xs8Yo1H/JJKmSffUCa6tvoxNWxyorHmX6dmtR2YLWZ33A4o6ZNYO/btpDSLEYjhHwfgwouDj7p0gORkjAWVogUrZHKfdXTgFTC+5iR0sQ6IsUwIZTxx7S8wz6o5lIKf1YEdSJx/M7nKsVa3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791598817; c=relaxed/simple;
	bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMuxHe9RgLV8U2Oaqq9wrmHm13UPSgBw0dxwYRpspmQXGzM0M87VB86PwL94zRlKx2/bZ0kuCzM+UzxJrwzE2aXREPlzgOBRWjVxV62shvCJHHpiZyFcZzSTycb4IcWMXY50ELYVUr0mudk6XcRKGTlvVGAIIHLlEC3DnxHInoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBSKGvnC; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBSKGvnC"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso135496a12.2
        for <asahi@lists.linux.dev>; Fri, 09 Oct 2026 19:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791598816; x=1792203616; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
        b=bBSKGvnC7+W023bCH8RFOlrayG+Bx3+k9hay77R37znxEhX20jRQ1gkzWloY5XcdI1
         cV7BNzkT7iu5MaxmtTqwc69IcEVDZQjP25ofASLNPbnLUKDxh/UyEFjiCSU0yEzom2Ts
         9Z75yFg+Wbe/P7z+J1UlLsPGiiHPq1rKu49kcW8bftLcSmqbmImwOoXOqQDPiszAz658
         HtQGebbtPZx4lUM2j57ZIBv0j1FP5hQUvMUAZSuJTSFITPTSWJGSfrRYhF5wt+3gMhCj
         3bcOHHkXyhCzuGs+lF9BS/HpzhZH2ysusd1Z3HnsuK45sldcHZpteTV9IjhKtyvOLe3U
         50EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791598816; x=1792203616;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
        b=s/CjB6S/S6t5rIB/P5p9OAjq5ikTk6UleNnPTIMs4Jlyk5nVWqcYzUb19vVgDWIrPV
         HAByIufbh44CKVaPcvYDwE7UmVcO+N0reBN3LYCxVz+8NDuA4+3/GlNXfyjCD4WagmsG
         VLEsOEg6V4naDjw8iLDRwhvZKri/O0SLIRQJxqmughl8pjFpF0JG4piM/B7GTfwuiY5P
         Sb10xeEmQB+WiQzKOOaXA8dDQtTmDGdrfihUGY2fjyCfpCdeV6QSs4Ps8Pl/ue+7h7NA
         Pn8gZ74VwS/rHC344EG9V7h+8HAO/PnD3/Z5x01HKU38QpXuQmpP5aFhQxjHkdg+4SR6
         vDgA==
X-Forwarded-Encrypted: i=1; AKwUvBxafV/QwOSM1vuOnwx3Wy1+mCwuG93QG+uZwk0qERI8phmTdNZ33lh6yocblTmMl9ZqXxsOfw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIzh7HHmSr1jHpsILNvQR6LnBkTBIjeJL5KEUCo3pR+RJdhp6ll
	I43qQM4NnBF3hzAhnc3zQWFRZTl2T9xnOex39nmw6qt1tvP8AI8mxqos
X-Gm-Gg: AYBFou2eWLWVVerB8s5QFS0FkDU4vuSTbg9BxrCFsFd60/E29JmvnGbpEMMcdUQ4KBf
	WUPiQdSuTn7gwJmqJsU4tKZ9JrntlFtfPWdGggqPcDEerGq2lQVgfaO08aEfaQcnwgpYq2wyFsj
	wsKVBMqr5RYS29Y2Gqk6zea0GYMSFW/r94/ICQ+msL+3OKwcXOh/YoZ/djhKI1B8rlJHlJpTeSD
	kJj3dvRaJWxhgvWrW9FCx1pmldopIZlovC7RV5+6iNRp5bmUFKsdgWxIL8taEVfTES4oih/5ghs
	/kQFrfuNhevMeUOUA/7W7wSROanLIMfUJYNjpABCm7CehhuQjLfbrNUFNFrWkkhtDN3tuvNjPi3
	3R2+GhxgrRXN0aekvOJp8RJqJjDPqKvNxYdgXM9RaQFGL/+R8dpGqN5rBh/LW9NE+H5yRhz7w8W
	BPtG0elX7whwc9M7XlhSsbsm7z3PG3wpub/px9l3ARFof0RqA/4BJcTg46n4hXQzWouhOrCUORl
	mZ5xdBPYdJkLzKbiGt9gn9ovMjiDuYQxivdseGuKoh7ucXW8KWKV9p/3aGo8t7JfRbpVgbWTD2W
	CqGa5lmcOdhjpACgdYu7MxcHr0cR0dEwT/FDfsoFlyeH3v4jn1M=
X-Received: by 2002:a05:6a21:4eaa:b0:3da:b8b4:91d7 with SMTP id adf61e73a8af0-3e16bab5c23mr3009407637.2.1791598815958;
        Fri, 09 Oct 2026 19:20:15 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c479c2cdsm1804113b3a.55.2026.10.09.19.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:20:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip power
 supplies
Date: Sat, 10 Oct 2026 12:20:04 +1000
Message-ID: <WT25lTvHQhioJE_CrUW6Dw@gmail.com>
In-Reply-To: <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
 <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 9 October 2026 5:10:01=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:29PM +1000, James Calligeros wrote:
> > Some integrators do not expose the power rails connected to the codec
> > in a way that can be expressed in the Devicetree. Do not require them
> > to be specified on such platforms.
>=20
> I don't understand how these cannot be expressed in Devicetree. What are
> we missing?

On Apple devices, the regulator(s) driving these pins are completely opaque.
They are not exposed via the Apple Devicetree or any other discoverable
interface, and they are not controllable. As far as we can tell, the pins in
question are powered whenever the machine is powered on.


