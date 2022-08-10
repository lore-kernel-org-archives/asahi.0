Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02A217EC
	for <asahi@lists.linux.dev>; Wed, 10 Aug 2022 12:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB35FC433C1;
	Wed, 10 Aug 2022 12:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660135459;
	bh=KA3dwPhdercQ+bjwAHZSLXEZgALOI5+blLRwOWv3xsk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=huzI43NGmEQHtVQIKUKaIqn54Pe12Y2tnG9TuUhj4L2l086g3kuVZBX7gWMfyAQnA
	 F/moX5+AjnGTvjlZJDBLinLQXTJhOd5nl2PzNTXDMJMkOIoxM88uyHsFYKWdnkA5Fx
	 HePsksH3dwh4+EcrZTP5Zw2EkJg5qprCzZzXhuMxqUBFmt2IX/4rC43XvLZkWvLATi
	 eMPeCCUV4a735dLWBOZV18fx8NVb8y4eWKqidwBcoz8bmXTdlT/liELClJke81WXok
	 v2x67hTPveR5huz4hYwgl9iZ+LH8IVrmSQ/ZGBs5YF9McIslXt7HlmR1pbPL7KMbEr
	 p0tBB27fxLTWQ==
From: Mark Brown <broonie@kernel.org>
To: Martin Povišer <povik+lin@cutebit.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: Frank Shi <shifu0704@thundersoft.com>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Stephen Kitt <steve@sk2.org>, alsa-devel@alsa-project.org
In-Reply-To: <20220808141246.5749-1-povik+lin@cutebit.org>
References: <20220808141246.5749-1-povik+lin@cutebit.org>
Subject: Re: [PATCH 0/4] TAS2770 fixes
Message-Id: <166013545745.24388.6261052304965817378.b4-ty@kernel.org>
Date: Wed, 10 Aug 2022 13:44:17 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a

On Mon, 8 Aug 2022 16:12:42 +0200, Martin Povišer wrote:
> The first two fixes should be straightforward.
> 
> The latter two clean up what looks to me like a mess in the setting of
> power levels. However we settle it, we should then do the same changes
> to TAS2764, which has the same template (and maybe there are other
> drivers).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: tas2770: Set correct FSYNC polarity
      commit: e9ac31f0a5d0e246b046c20348954519f91a297f
[2/4] ASoC: tas2770: Allow mono streams
      commit: bf54d97a835dfe62d4d29e245e170c63d0089be7
[3/4] ASoC: tas2770: Drop conflicting set_bias_level power setting
      commit: 482c23fbc7e9bf5a7a74defd0735d5346215db58
[4/4] ASoC: tas2770: Fix handling of mute/unmute
      commit: 1e5907bcb3a3b569be0a03ebe668bba2ed320a50

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
