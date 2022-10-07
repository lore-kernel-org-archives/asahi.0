Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42FF5380
	for <asahi@lists.linux.dev>; Fri,  7 Oct 2022 23:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC1BC433C1;
	Fri,  7 Oct 2022 23:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665184667;
	bh=g4k39+l5WOW6KmldEWGm/pmbP8ZMxghfPuq3gJQX1+k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=atCzcVdvVlyTQ+aCgrh4pXO4NZes0/NC88Dq8sqDjG27qOxtSg06vPTQsKLfrDFUs
	 M1fAVgmxaMEIT8gVgghyOqXW1D82NtjReYgQqpHHXcyNh7op9Jpj4jbo2V+aazStNF
	 m5hum0hsbQhfshxfXBIdtXtVwTtLbtVMq1LKzUXZiCrASvkwK8pYVGOHvjG9QbZS/l
	 IUtWPudj6le0WzVRlTxcljgbpGj5VMXNNfcCED+y5WiR85fBQSFTOvrlKGzsDROE/w
	 qsD8PcqHrIrjZAElY5l5P8k8sOyjpbmmcOpd+TwYEsYIL6Ev26vfFHRZ+gmmuHCzq2
	 hTLzTvjtOQApA==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ogwbB-00FDKL-4F;
	Sat, 08 Oct 2022 00:17:45 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 08 Oct 2022 00:17:44 +0100
From: Marc Zyngier <maz@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev, Hector
 Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, martin.botka@somainline.org,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 jamipkettunen@somainline.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] irqchip/apple-aic: Add support for A7-A11 SoCs
In-Reply-To: <20221007200022.22844-3-konrad.dybcio@somainline.org>
References: <20221007200022.22844-1-konrad.dybcio@somainline.org>
 <20221007200022.22844-3-konrad.dybcio@somainline.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <37c075fc9aa9624d65b8fdda3cb5ae96@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: konrad.dybcio@somainline.org, ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev, marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, martin.botka@somainline.org, angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org, jamipkettunen@somainline.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On 2022-10-07 21:00, Konrad Dybcio wrote:
> Add support for A7-A11 SoCs by if-ing out some features only present
> on A11 & newer (implementation-defined IPI & UNCORE registers).
> 
> Also, annotate IPI regs support in the aic struct so that the driver
> can tell whether the SoC supports these, as they are written to,
> even if fast IPI is disabled. This in turn causes a crash on older
> platforms, as the implemention-defined registers either do
> something else or are not supposed to be touched - definitely not a
> NOP though.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v3:
> - Replace use_fast_ipi with has_uncore_ipi_regs in aic_init_cpu
> (logic error, this was written to regardless of FIPI usage before,
> but touching Sn_... regs on SoCs that don't explicitly use them for
> IPIs makes them sepuku..)
> - Drop A11 compatible
> 
>  drivers/irqchip/irq-apple-aic.c | 47 ++++++++++++++++++++++-----------
>  1 file changed, 32 insertions(+), 15 deletions(-)

Since you cannot be bothered to read the review comments on
the previous versions of this series, I'll do the same with
these patches. Feel free to stop Cc-ing me.

         M.
-- 
Jazz is not dead. It just smells funny...
