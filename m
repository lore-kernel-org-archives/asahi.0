Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9C03E16A8
	for <asahi@lists.linux.dev>; Sat, 16 May 2026 15:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778943754; cv=none; b=ApoLa1DD8QsBw7rZ8zxztg/y97PkJF+79CmiKg8NMWWiH5SLQ1NTJZDMpS4j+T0FSLCYBwr7+nlZu9cQFNL9ofQvmWOgSI1QXbRvPlir9XhUbALdgGpBLySO4i2jiisExHaT99QfkuJ+AvbJZ0ZAOplGGtln9X8V1rL+QujI5NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778943754; c=relaxed/simple;
	bh=fhRmHI3gE7o85B5IehRC0zbKRLMe1rUp+E277EsuYZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ed2e9pHOz2LZaAYPG1Qi+1m4VcGkxm/vEzFqFKWme0TkCHzlcGku8CMm8WQ4E9u3FMUydVb4JW9jiC5vSSEB2l8nyB6sm6lCiDJdKcu3dmJ2b5iQ3CqAWnriOSa67lUK3CEbMkI59uIzBk4obZ9+CFLa3+KATeZG5nxgYiqeo5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNRfxJ0M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNRfxJ0M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415C7C4AF0C
	for <asahi@lists.linux.dev>; Sat, 16 May 2026 15:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778943754;
	bh=fhRmHI3gE7o85B5IehRC0zbKRLMe1rUp+E277EsuYZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TNRfxJ0MjhJVOYNjHQoBmIEmaI/ZXek/+zecaLwE7Lpj4c6gwx1NSsDP8p5CM/lR6
	 yljtIuK1uKntoKhcOErGSkgnRJAWcSfaIO43Sy+2XMCuhu2gFiIGCqANWtMDBwbJkE
	 fsZSDW1eYVl5U5VRv54sMrooCp3YOig7xhcyZ6kQZRCQ8sPij5SUrHVfXhEpURf6L5
	 oy5am63So1CsTOgiCSmmwLzJ4UwtN9lHQ+uD86yCWVDsh+X4lPCMFGo9d7wJyiI/Us
	 Om5j/fnLc28XYOVF8YCI5k/mMdHVnqp1dAal/1CJQrtIzis0TFgk+3LwCkTSHA1ybB
	 ClUP85jLQskuw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a995ab70d1so1313757e87.3
        for <asahi@lists.linux.dev>; Sat, 16 May 2026 08:02:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9JC9NWIThgID3CJ6UXk5gXa0o0F7KPeXokUCdyaixQvy9Y3ilsg+iS2raYUU3jDpVc+buV8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLl/OtqsZIX+394YfTU+XOcvg3DNCFYUUjkhjO6mdn79we3RDa
	WGm4/b1wf0++5gq7pUDXatlwQuCZ3vlE2/TXhhM7TaizG3tlg6LdKZMes+lfsQuJOVxzOZ1cpnv
	cDB/fuQ6hWPHTzti2I5qddh+ONVDXEh8=
X-Received: by 2002:a05:6512:3c8c:b0:5a8:84a5:bffa with SMTP id
 2adb3069b0e04-5aa0e6191a0mr2385235e87.5.1778943751745; Sat, 16 May 2026
 08:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1778692164.git.u.kleine-koenig@baylibre.com> <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 16 May 2026 17:02:18 +0200
X-Gmail-Original-Message-ID: <CAD++jL=XR1XMdGoLGYdbK8DYc52BidWDhV35auyGJo2FRK+nog@mail.gmail.com>
X-Gm-Features: AVHnY4J_BRpuyVIajVUy2Bk72DemUmM0wrxlDP6FCrL_F3X-aoIfjJho3-JZTYQ
Message-ID: <CAD++jL=XR1XMdGoLGYdbK8DYc52BidWDhV35auyGJo2FRK+nog@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: Use named initializers for arrays of i2c_device_data
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Li <nick.li@foursemi.com>, 
	M R Swami Reddy <mr.swami.reddy@ti.com>, Vishwas A Deshpande <vishwas.a.deshpande@ti.com>, 
	Peter Rosin <peda@axentia.se>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Oder Chiou <oder_chiou@realtek.com>, Fabio Estevam <festevam@gmail.com>, 
	Kiseok Jo <kiseok.jo@irondevice.com>, Kevin Cernekee <cernekee@chromium.org>, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Chris Morgan <macromorgan@hotmail.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Marco Crivellari <marco.crivellari@suse.com>, Weidong Wang <wangweidong.a@awinic.com>, 
	Aaron Kling <webgeek1234@gmail.com>, Teguh Sobirin <teguh@sobir.in>, 
	Luca Weiss <luca.weiss@fairphone.com>, Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
	Hsieh Hung-En <hungen3108@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Shimrra Shai <shimrrashai@gmail.com>, Zhang Yi <zhangyi@everest-semi.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Qasim Ijaz <qasdev00@gmail.com>, 
	Sharique Mohammad <sharq0406@gmail.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Neo Chang <YLCHANG2@nuvoton.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Kees Cook <kees@kernel.org>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, Tim Bird <tim.bird@sony.com>, 
	Bram Vlerick <bram.vlerick@openpixelsystems.org>, Peter Korsgaard <peter@korsgaard.com>, 
	Wenyuan Li <2063309626@qq.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Xichao Zhao <zhao.xichao@vivo.com>, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Markus Schneider-Pargmann <msp@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 7:23=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:

> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>
> While touching all these arrays, unify indention and usage of commas.
>
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

This is generally sound, so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
