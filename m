Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4241EFFB7;
	Thu,  6 Aug 2026 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022876; cv=none; b=SabqV/pdwtEzHXY0k0YsY8N/hBv9Z0pCchcCFDdFtZkTBnFlsVpIm4Vn5hbO5kvPVET2hNDgAD8WosyGI5qZZ+Y8pR3UGDjuG/mNtaQ0mp2YEK6fTeqmBc+ok32r9NuXncK+imBx+B1c4xJt0E7yuG7Hr/kHNlHR6jtHamKwPjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022876; c=relaxed/simple;
	bh=1ak0IV048ez6ZJ2Otmidn2YVnAkXS4wko/pIghTkr8o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ObEBNaTH2cBzTn1A1abpNCCCKPEzlnpafGIXmp52gxE67LpmQfOzuVuxI5I+bGD3hGiV963vAQryM7FLSd/JDTjbcS2HqtWmQLiqc2Oz1wUxU/3K84CfxYRHol/tT2emxYbE3DDaAAFellUcwZ/tsSn0pM3VUCxIVgc2/r96y4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J35RsWNO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J35RsWNO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1BB1F000E9;
	Thu,  6 Aug 2026 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786022872;
	bh=L8jsxfD1Sng44V4oHYHFMOll9m0IRlIZD/U2bbjbvA0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=J35RsWNO40WhRirfC4WcVvW5ghJyxSAX71JiGDqce+d+8AkrtuC6ZmPA6y+5FuIJL
	 /PDtJaOCbERk9CmXTpgn64dIN3MnmtiQzLrwRcF7wTYs1tygWTm1Es4mpj7+2zvgPL
	 C1qfkogW+m76wu764tELCSFgxscsodb00mLqki/5CcBWeGVaUIiA2oMAlooJ42WPJY
	 GR5585zJCh/8BAdxmpNTCW+/C0WeHxLXdBrgUzYvejZOUmymnGsy95dOl0NVT2uzRy
	 rjD7zRJr3on3sSikI4aNtenceu7Mm+sKJA/0L+CyAjR0PikxHRMOARhlcLmHnEj7u6
	 gVf7xyVFnnLSg==
From: Lee Jones <lee@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>
References: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>
Subject: Re: (subset) [PATCH] mfd: macsmc: Fix key count endianness
 annotation
Message-Id: <178602287064.2920636.6724369399863023902.b4-ty@b4>
Date: Thu, 06 Aug 2026 14:27:50 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sun, 19 Jul 2026 15:00:32 +0200, Sven Peter wrote:
> SMC firmware returns the value of the #KEY key in big-endian unlike most
> other keys. Reading it through apple_smc_read_u32() into a plain u32
> and then converting with be32_to_cpu() makes sparse complain:
> 
>   drivers/mfd/macsmc.c:462:26: sparse: cast to restricted __be32
> 
> Read the raw value into a __be32 using apple_smc_read() instead.
> 
> [...]

Applied, thanks!

[1/1] mfd: macsmc: Fix key count endianness annotation
      commit: 0a29aa605286bcd01632eb6b61f59b9053312347

--
Lee Jones [李琼斯]

