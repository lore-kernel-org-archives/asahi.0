Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723943C35
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 09:44:42 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1662371079; bh=UuiZBQrk3PkxgO4/DkhLIrDD9ZaCQxTMdt1KEb2j7EM=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=Bk/TT7cPidOmX6ahdFI2MrqSMRZS+vn/0NY6KUScFZzqAHQfvZvMnMp0l8sNXaJAu
	 Qg/VOM876LH+AftUOPKpvCCFzGDOO2JIPsYLrp/dfuUz4DLtFp0cryr1bPvrDfgdM0
	 yBSN4qQ/USJ7dzvMDKP0Bw1NwkxvFQvnjfTtzwLs=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM/APPLE MACHINE SOUND
 DRIVERS
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20220905093546.19735-1-lukas.bulwahn@gmail.com>
Date: Mon, 5 Sep 2022 11:44:38 +0200
Cc: Mark Brown <broonie@kernel.org>,
 asahi@lists.linux.dev,
 alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4DB82E66-0BB9-4B43-917B-55E115994876@cutebit.org>
References: <20220905093546.19735-1-lukas.bulwahn@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>


> On 5. 9. 2022, at 11:35, Lukas Bulwahn <lukas.bulwahn@gmail.com> =
wrote:
>=20
> Commit 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver") =
adds
> a new sound driver at the location "sound/soc/apple/", but it adds a =
file
> entry referring to the non-existing location "drivers/sound/apple/*".
>=20
> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains =
about a
> broken reference.
>=20
> Repair this file reference in ARM/APPLE MACHINE SOUND DRIVERS.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Martin, please ack.
> Mark, please pick this patch on top of the commit above.

Hi Lukas, fixed here already:
=
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?=
id=3D55e2bd9c41e800638676dce3f19dcfd16b309a08

Best, Martin

