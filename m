Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDB3347524
	for <asahi@lists.linux.dev>; Thu,  9 Jul 2026 16:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616201; cv=none; b=lVLysfWBXMz+vE0viXp+AK+Ik3vehPWNWskZFugXktRaaS6xd8DE17sU353lXNDHXQZmKkJvhZxJGHI/y0r2lVtlTM7acN+AXKVOFErNafTYXYqYFVwnTUADHWUecp/v+fFn29+q5rk5/DrHux0t2F5PWi55xSAJrztpEL0ASrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616201; c=relaxed/simple;
	bh=ZleR3ioJcTTR91AyToYtwQAV3TlNsGAWt0uRafzJSY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/xBEWlLw0uzFGv1wkbkMa7yQQmFfJRkZXOKw0VZrLLLf0YbunWD2+Xy9nRK97S4BbdTJ/LAwVvKXtsvL/S8mlTpDYpxiqf6ub5eFUrmaHGdsIPcj434EuyBXNXrq4cS3ohn3olSLB57gXVFy4p5O9xDrJ4Ep7uKRxioa0w0MH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+V2Xb57; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+V2Xb57"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC341F00A3E
	for <asahi@lists.linux.dev>; Thu,  9 Jul 2026 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616200;
	bh=ZleR3ioJcTTR91AyToYtwQAV3TlNsGAWt0uRafzJSY8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=j+V2Xb57NLIFLSI2VHWxiWexNMgM9piikLd9PPCADeMgIuP8N8LL6BYbJPuMqZLP8
	 HwlqoyhGsYsSlBGpEmESL3CXdNsgS7kMpxL3w4AMxgq9Z1ewmkHSBCnqEDCPbYHp3u
	 NtqGVNIARB7ycQMR7ELfctG/nD9wS7A3u3mam8BQCcAdIqYFM8+9+BOSLbrM5Z1nam
	 Et38NkbI/rMCVGnM2UbC8gl2PxFf7GzWGlJwyX79ZKwpQMFI0UuS85yYHOzmVJ42U1
	 HuiD3dUXwsR5Wh87eG6Qm2GD4yy867GGP7bgBLfExF2Zqujy2yE08k6nZgHNDd4l2I
	 pm165rk6vpj7A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b018fe8318so16721e87.3
        for <asahi@lists.linux.dev>; Thu, 09 Jul 2026 09:56:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoZ73ULDoxU5SSMyzUslyoENB7LRfnSHEioEWNIQgpkn2HeoU5rQIwmgXb9HrLp5SixDXAGlA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8ieM42AbEaydCh6ZWaqQZw11WTnvzuL+hq6H64ohuGislIiE9
	CPeD2A+4Dn2nHcbVdWKsXd1pQiftcgtUSfpk7xkEZKhwOmV5I7Qsb5gKUV5sTiURy7F+uzQQOKJ
	NHCehibae3b5DYzM5+5pc1yjrzemwPtA=
X-Received: by 2002:ac2:522b:0:b0:5b0:1108:c57d with SMTP id
 2adb3069b0e04-5b0114a2c3bmr1207530e87.46.1783616199309; Thu, 09 Jul 2026
 09:56:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708125002.202515-1-phucduc.bui@gmail.com> <20260708125002.202515-2-phucduc.bui@gmail.com>
In-Reply-To: <20260708125002.202515-2-phucduc.bui@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 18:56:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLnHSmtKeMhoqfDgn91E8WfQ8Oyk6MJxEkZnV7hPLxUHZw@mail.gmail.com>
X-Gm-Features: AUfX_my3KdOnJKpeFWZERXUk0JY70PEAnydvzyPe32uBhM8Y96UyY2wPOq0eHcw
Message-ID: <CAD++jLnHSmtKeMhoqfDgn91E8WfQ8Oyk6MJxEkZnV7hPLxUHZw@mail.gmail.com>
Subject: Re: [PATCH v4 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com, 
	christian.ehrhardt@codasip.com, Arnd Bergmann <arnd@arndb.de>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Chris Morgan <macromorgan@hotmail.com>, Dan Carpenter <error27@gmail.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, Rosen Penev <rosenp@gmail.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, Teguh Sobirin <teguh@sobir.in>, 
	Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 2:50=E2=80=AFPM <phucduc.bui@gmail.com> wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Looks right:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
