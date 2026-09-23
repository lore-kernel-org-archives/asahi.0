Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D7739E9AC
	for <asahi@lists.linux.dev>; Wed, 23 Sep 2026 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161963; cv=none; b=FYAo7Pu1UP+vB4gLtuGERcXTXXn+ELF8KNwvoDftj5mKh8VWWod+7ZMxg2I/lyfQy6w9X9nst0cQ5es6yo8++N83z3J8LuOAo0msUDubfJkK6WGRceAkeOblOLNUf+jCZFMdtr0TG1ABlTfvsakXAFLqFJkmzXiWVyqaXoRwcHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161963; c=relaxed/simple;
	bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RiBw2Gskqyvi7xxrjOFIBSYyhmVBCDf4WCOsH/xHOTqoVGrd9vEqG8twMgvX9ykx9oJfM+/RHajEKbKLOVPLHkAQxh5clpXn0Mmtt48xrAIyzqfUXOzDeEZQUd5lSrXahj/vwt9jBp6mczJy0OrLbqQ2R3Pwj1PxJZUVMwRiZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ydpoq0ee; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ydpoq0ee"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91c22d27dso2814055ad.1
        for <asahi@lists.linux.dev>; Wed, 23 Sep 2026 04:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161961; x=1790766761; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=;
        b=Ydpoq0eeXsK0d46xve9fQxX+DKSWIToadvvbzlFEyT4vhd9SXkUJ+OI7QfF+gYP8oV
         koXLHPtCzCC1PxbxXuM+3q7JNSoSIR7IACBAkAwe/yGh0iYgKLtkAWUsCqHTIwuHEZNr
         lXZncrr8ZQbXIJaYMqE+umkxCdsuy74xWSrV9xtBDhaKt2Q8g35SWvc8L1RjDDWKBQ6t
         OFQ6aqXcimRJ9XSfgcT2VhkYn9WI9xMzTdU6ubIxXQoWIKU3KTrCsgVi5olH0TZJmO1H
         C4mRPhuk6d+/ZqJe+JvTPUqTZPCBnuOJKoCdWKUIugWKE0m89DDWOh7bj5e54HSJhPQ6
         49ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161961; x=1790766761;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=;
        b=LUQvJhMaft4X3RXyqXQECYHtEy4rjxCtLWDPaYXc2E8j5IQSSQenFDaQt+4ctg3Srb
         WLurcRxFYwT3qQ1h1S/kQd7zeJke6HpFfyXpcoaDUFJYVRBsDVaX746Fy5fyhYzkVvnP
         GKin3H6DFdsDn6QAxm2s6N1D9MhgvTtol5Zh/BVjPx6NcDoq6IZhCTwD+DMQ6VaFzfQL
         4Ykj0YJ0XjC/sPxC3idZMeI01qxR4G0TdTynBdYD/yA1wWFb/lksCIgOmBFtYX7og3x9
         F/JCdykstO/nVGeIugIguJs1/59P8Bqa4Nk7+eUtS6IbFDYQL+qadu9seADjc2J0zX1h
         nDDA==
X-Forwarded-Encrypted: i=1; AKwUvBzKUJ5/7mEP/6lLtUv12J7BBgegweTd1IJ6M/tB+gXtOShe3OUQJNKJBPP095RGCUpdP7Mhjg==@lists.linux.dev
X-Gm-Message-State: AFuF++l+wGCdrnlWvTSqdk+upH6hhUdZmdLdWRLHK8Xgnzy9fYt3x74E
	zo9awp5OajBFEn4GwOxLz5PnaENi9RoB3lU/Ug6A1HPTbeTBIHOswxbb
X-Gm-Gg: AYBFou3zn6EVYbv3203bJvne8mNrXQ6TnG9P5iqIEhaaWLwtEzOqdOjA7z5+FXPdVoN
	Ou/86+kvd12eRSQrRfKHyLmKVBAKvWv9qDa1NxsLq61Ae2n0sjrrEsjQhvpQjloB6lCIu2hJr9y
	95jhT4q0Kkta+tcWOnKKO0PTlZvahMJZIT9tWhUs7gUObI9fXMt1jX1Sl49G4mnUYKq4XI4qttZ
	XCJsHSSUpDo/pQcnvTFvNyxj5U/VIV/VHbmQjjKR+iwrmHsQG6pK1sfeWEkQSHK9+1dju6CeCgG
	8MfFjiGgpqc0J4U1FufgJs6XjjWhIIeK4LNOy1XBs+4YIbKaC88PakVfer3g7PjsOIwhjMn9Z1K
	Pn60vdHtH9/S4EmSZG08ao653IDOZ7O6Jdm+gTHMlSLnX7SDP4mf+IzLRBOT9QkfMbVf6NEryYM
	okLeduXg9kSJ6H4AAtZSvEefgAiQ5z+OZlO9pS0Ki6wRhVAe67T7Kv46c2bsldqka0g2j/C9uLS
	CmpDdoSUat9Q9tYIhCGX7gl1BLoAdASznnh/9MNX59hVejAjpN/NB1DN8/JlulAUianThpZ34du
	lLG15Jiq1NPBqKmpUzOKSEAtzgYnrij7hvI1YDLVvYSuHx+hmp4=
X-Received: by 2002:a17:902:d54a:b0:2dd:c053:d739 with SMTP id d9443c01a7336-2df69dacfb9mr19455635ad.32.1790161960734;
        Wed, 23 Sep 2026 04:12:40 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f5886sm8814555ad.72.2026.09.23.04.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:12:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 10/28] ASoC: ops: Accept patterns in snd_soc_limit_volume
Date: Wed, 23 Sep 2026 21:12:29 +1000
Message-ID: <EVVfptRVTru_6AKB_uY-lw@gmail.com>
In-Reply-To: <arFa+frv9QcL4b36@opensource.cirrus.com>
References:
 <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <arFM5QGrJx1aYhGK@sirena.co.uk> <arFa+frv9QcL4b36@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, 22 September 2026 2:27:37=E2=80=AFam Australian Eastern Standar=
d Time=20
Charles Keepax wrote:
> Are you using the wildcard mostly to skip the component prefix
> stuff? I wonder if adding an option to match without that might
> be more explicit.

We use it in two places. The first is as part of the speaker protection
system, to ensure that all the relevant kctrls have been locked by
the same owner (us). This one just matches without the component prefix.
We also use this facility to eliminate duplication across left and right
channels, matching partially on the component prefix but without "Left"
or "Right" in the string. The second use case is rather superfluous so
I am happy to get rid of that. I think at that point it would make more
sense to just construct the full kctrl name in the driver and pass that
in to the existing API in the one place this actually remains necessary.

>=20
> Thanks,
> Charles

James



