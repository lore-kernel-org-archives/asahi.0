Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FD3F51D
	for <asahi@lists.linux.dev>; Tue, 18 Jul 2023 23:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59D9C433C8;
	Tue, 18 Jul 2023 23:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689722794;
	bh=nvvw5vLzvyT+g9nDympQREpx5x4EtYJxfB0fnvV4dnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BSVtMvLq+GO0IChSbpv2jVpS9Q2xzLtvM/lR+6iSDx2ycV5+RB3fZ3CopoaIo4+n/
	 Oj8G2IfWrVb3/K0IlJ0Rb7DBbKzsavBbZsXqXs0yEnj1xGs3WmBufkhgJF7lbZkMTH
	 ui2tj7neURWCdHSoRoLDdVQzgAAZEQmtGnGe9Zs8+z2z9mUwIeIJ5fr3OwpiF1H3fA
	 oFwCa1mhxFxHHfXzK8MB3Yc53g8eeF6N49AhfCQESjWy/r6nyVHPITkvGy+REZ0pxh
	 d67AnhI1Y1lkLdzJy1iGxrgEMt7Q08zHZ4ea7O7EOmONnTToQ9HQNMKYIItzWjANnt
	 NJ4NEHku5GJug==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Mark Brown <broonie@kernel.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org, 
 asahi@lists.linux.dev
In-Reply-To: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
References: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
Subject: Re: [PATCH 00/48] ASoC: cirrus: Use the maple tree register cache
Message-Id: <168972279238.134634.6122845641864577538.b4-ty@kernel.org>
Date: Wed, 19 Jul 2023 00:26:32 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9

On Thu, 13 Jul 2023 01:13:13 +0100, Mark Brown wrote:
> The maple tree register register cache is now able to generate multi
> register writes which was the last big feature of the rbtree cache that
> it didn't support so let's update drivers to use the cache with the more
> modern data structure.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/48] ASoC: cs35l36: Update to use maple tree register cache
        commit: 317af09e296f70e4fb55b17f49655e103a794172
[02/48] ASoC: cs35l41: Update to use maple tree register cache
        commit: 78138627acc014dc3a23cb6f29f53a025544743f
[03/48] ASoC: cs35l45: Update to use maple tree register cache
        commit: f9ad18b24c24b06820fcd72975f1b08b1d466168
[04/48] ASoC: cs35l56: Update to use maple tree register cache
        commit: faa48c9bdaa1625b008d07ce08660d56f198592c
[05/48] ASoC: cs42l51: Update to use maple tree register cache
        commit: b5a0e5e4bf96de3d34f3d36afc32b3e9cd0376c2
[06/48] ASoC: cs4265: Update to use maple tree register cache
        commit: b0a0e231abb5c3753d479d49d62308c7a1b20838
[07/48] ASoC: cs4270: Update to use maple tree register cache
        commit: 7a2827ad082cb70bb7884e5630b58503e41b2932
[08/48] ASoC: cs42l52: Update to use maple tree register cache
        commit: 99d2c7b8e50458bb620bb7b3d2ed809484a7ecd3
[09/48] ASoC: cs42l56: Update to use maple tree register cache
        commit: cb8ac2658f8ae2a3a921b0c4f3400922e361597f
[10/48] ASoC: cs42xx8: Update to use maple tree register cache
        commit: e3753fd3b362e01c9faabbea4412d6eae24cfdff
[11/48] ASoC: cs4349: Update to use maple tree register cache
        commit: a4ccfe889dfe1eb1b6304402169b140fc329f535
[12/48] ASoC: wm2200: Update to use maple tree register cache
        commit: 4c04586a7962598933313fd08f19ed76138c1fd9
[13/48] ASoC: wm5100: Update to use maple tree register cache
        commit: 4f2e3688abee076f49b78b5d4fca67bb37dbe375
[14/48] ASoC: wm9081: Update to use maple tree register cache
        commit: 1a37aa4195e2169f2ad6d74608bfcaa95697c9f8
[15/48] ASoC: wm9090: Update to use maple tree register cache
        commit: b028b1efe7103e5a2a01d7ca087fd43c2d4977e6
[16/48] ASoC: wm8510: Update to use maple tree register cache
        commit: d3c4ba7dbe15e5268ba07f2dcefafd274d110e80
[17/48] ASoC: wm8523: Update to use maple tree register cache
        commit: 247c6960bfdabeae5088b4ecf5e06a68b1ae492a
[18/48] ASoC: wm8580: Update to use maple tree register cache
        commit: 43bc153d2e684dcbd23311899c136b183ba21840
[19/48] ASoC: wm8711: Update to use maple tree register cache
        commit: 368a233bc3cf590bea7f27774cc94ff121addd65
[20/48] ASoC: wm8728: Update to use maple tree register cache
        commit: 9a2abf70e2635a59fde1806994387a79fb351308
[21/48] ASoC: wm8731: Update to use maple tree register cache
        commit: 59bd5113d8ca0765e8f12307a4b1ac0e3daa91f4
[22/48] ASoC: wm8737: Update to use maple tree register cache
        commit: ee8169f94985e5c88d2c4e9daed0b5f8345032b1
[23/48] ASoC: wm8741: Update to use maple tree register cache
        commit: 5dd4ddde85586f4b53be219f27cac2cd15e02417
[24/48] ASoC: wm8750: Update to use maple tree register cache
        commit: ef1589123dbb7102b49f9997c5b31b0721aff242
[25/48] ASoC: wm8753: Update to use maple tree register cache
        commit: 3c884cb5c28c45197b81bbdcf2d41a37649ee895
[26/48] ASoC: wm8770: Update to use maple tree register cache
        commit: 7aa7ab713b71fddc71603b9b3c9ab963fd9831a4
[27/48] ASoC: wm8776: Update to use maple tree register cache
        commit: 080c82a56659fd5cbf811007193bf04d3c31922e
[28/48] ASoC: wm8804: Update to use maple tree register cache
        commit: 200ba27767702c11f965e619b43ebfe9989a1996
[29/48] ASoC: wm8900: Update to use maple tree register cache
        commit: 2c609c6b42c911df772d97c4ddf10d9374607e0c
[30/48] ASoC: wm8903: Update to use maple tree register cache
        commit: 7de380eeba5b616a4bf08acbbc5aa6e76bcb4299
[31/48] ASoC: wm8904: Update to use maple tree register cache
        commit: 9bd4bc4cb48927d581ff2886bf701bfdb4735724
[32/48] ASoC: wm8960: Update to use maple tree register cache
        commit: 11e1354036391054f496aa4c4e724e160dfcded2
[33/48] ASoC: wm8961: Update to use maple tree register cache
        commit: d643047ec77ed17fef7b2ce76ecd5e88b3b5f7d8
[34/48] ASoC: wm8962: Update to use maple tree register cache
        commit: 3a17f8d71bba92538165a5b55f095b7cb0e71529
[35/48] ASoC: wm8991: Update to use maple tree register cache
        commit: 3aceedcda294273bedf7af7836e2457a98836b09
[36/48] ASoC: wm8993: Update to use maple tree register cache
        commit: 663aa3325f5b971596b08c768bc705cc6f49dd18
[37/48] ASoC: wm8995: Update to use maple tree register cache
        commit: ae394355be78c6be4da1a6f18da8b588215aaa2c
[38/48] ASoC: wm8996: Update to use maple tree register cache
        commit: a4b6c6ec975c9f871cbde1f30a554665475498ef
[39/48] ASoC: wm8940: Update to use maple tree register cache
        commit: 9bed789c4f14bd607892ff31d9164b5ed544ebaf
[40/48] ASoC: wm8955: Update to use maple tree register cache
        commit: 6066d156a3a36139feb0c80645dddadae2ddaf01
[41/48] ASoC: wm8971: Update to use maple tree register cache
        commit: 97f93367cd735813aa5bf0d7ef64c956a7ac8013
[42/48] ASoC: wm8978: Update to use maple tree register cache
        commit: 5891932208f76375940a2a96b113fd328b70ddd1
[43/48] ASoC: wm8983: Update to use maple tree register cache
        commit: 20dbc7a892ffe6aa20a4b1eaf0353cdf4c762fcb
[44/48] ASoC: wm8985: Update to use maple tree register cache
        commit: 2fa0213ed798bee59fa815171d3855dcc133a416
[45/48] ASoC: wm8988: Update to use maple tree register cache
        commit: fb60b65a65b038f1881a3f1a0146c07e22f647d0
[46/48] ASoC: wm9705: Update to use maple tree register cache
        commit: 7e510925e00d1daea10f9474505b4f1b9ec24433
[47/48] ASoC: wm9712: Update to use maple tree register cache
        commit: 2e3a4ee07211b047881b3f2e944453cdd4deaf96
[48/48] ASoC: wm9713: Update to use maple tree register cache
        commit: 8bfb4c81b9c896448e5d7229f1849bd0ad7c2f20

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

