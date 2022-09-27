Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E842588
	for <asahi@lists.linux.dev>; Tue, 27 Sep 2022 14:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C4AC433C1;
	Tue, 27 Sep 2022 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664290121;
	bh=ZeMk/3E0OzkkDISoQSihxyFtSKw+qjaaKWkV6nZIzEo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TG8UvWh22vkK/rZywCv916Cwq36ZrOfVIkggJbi8zN0YWz5hgBfEScU8bmQMwtth6
	 Y6OoRpY5zzib6stCysGC5QMoSvOcYpeKExGtZtgPH4FlB/o6yMVF/BctIFdCRlKqYT
	 eNrR2gODD8kuIhm/FUg/iuyj2rRTzmXCN70pNtlSt/Ft4e7CRfNwzFh0TM6288xdps
	 aNoRwxXK/i5ZppbRFm3MZsEH7afxwVuRdY6r2RDCIp5FzZtRJ1WDRtrvd8RIaNBCV5
	 Qx4o27hLdzxPqTAMbZBNag8BqtKYXCgJn0ic4NknRFCaL2CMXyKnwe/fht5oHXGF39
	 8knVGMYfhLwXA==
From: Mark Brown <broonie@kernel.org>
To: Martin Povišer <povik+lin@cutebit.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
In-Reply-To: <20220927113426.49724-1-povik+lin@cutebit.org>
References: <20220927113426.49724-1-povik+lin@cutebit.org>
Subject: Re: [PATCH 1/3] ASoC: apple: mca: Trigger, not deassert, the peripheral reset
Message-Id: <166429011948.444806.10905154613892329863.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 15:48:39 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921

On Tue, 27 Sep 2022 13:34:24 +0200, Martin Povišer wrote:
> Replace the deassertion of the peripheral's shared reset with the
> triggering of a pulse on it. This is what we should have been using all
> along as the platform's custom is not leaving the reset asserted on
> unused peripherals.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: apple: mca: Trigger, not deassert, the peripheral reset
      commit: d584e73e7310971cc226ef0e2a1bc0526da0d582
[2/3] ASoC: apple: mca: Remove stale release of DMA channels
      commit: e92e50e4263f5cf9c731ef5593c31f94dc3b7b8c
[3/3] ASoC: apple: mca: Adjust timing of component unregister
      commit: db6ae79a7e4f729457ec42db5d6d0fbe0e35784c

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
