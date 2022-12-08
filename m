Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD5B629
	for <asahi@lists.linux.dev>; Thu,  8 Dec 2022 05:38:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A4A2541F72;
	Thu,  8 Dec 2022 05:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1670477931; bh=4d6mB9PvrA0IQLEv97GyxkdCgPLBiIYvjnKz/z7F5O4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=xUfCJOMvLijxJoJP1niRKanugCRWBOeN66w1xsm+sYeH7D1i9sP5QuDvI9ghv/VwS
	 4Ug/aFzUOX7vz/5s7ljYg98Ie3aYOnO/JlrfIP7+HqParM+HDQ7TSZb44mCVNsmywu
	 PSQLw8RuTz6Taayvl7Okij7PZ1kmkZEtM43h/dU3/+vLxYZFsEPQT+tcZ8J71r+lae
	 VhaCI1cmDSJ1dAc68f3GKYgaDH5+qZLCznI5nhu7SYtOXbx8v+cOiraiNJHRULNvE6
	 zIzGVwDDOlPZcyljIBnl9bx3MgZvlGzPfJa6q8a+So37GdGIAcZv/rvuyTLXDgggHE
	 fZtvSrbXV1YvQ==
Message-ID: <751ec272-e5cd-65a8-cf26-d37aade972ac@marcan.st>
Date: Thu, 8 Dec 2022 14:38:45 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] arm64: dts: apple: t6002: Fix GPU power domains
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>
Cc: Marc Zyngier <maz@kernel.org>, asahi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221207014305.21018-1-lina@asahilina.net>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20221207014305.21018-1-lina@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/12/2022 10.43, Asahi Lina wrote:
> On t6002 (M1 Ultra), each die contains a self-contained GPU block.
> However, only the coprocessor and global management circuitry of the
> first die are used. This is what is represented by the "gpu" PS (the
> one in die1 is disabled). Nonetheless, this shared component drives the
> processing blocks in both dies, and therefore depends on the AFR fabric
> being powered up on both dies.
> 
> Add an explicit dependency from the GPU block on die0 to AFR on die1,
> next to the existing die0 AFR dependency.
> 
> Fixes: fa86294eb355 ("arm64: dts: apple: Add initial t6000/t6001/t6002 DTs")
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  arch/arm64/boot/dts/apple/t6002.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
> index 1376103b49c6..8fa2d8dd72ff 100644
> --- a/arch/arm64/boot/dts/apple/t6002.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6002.dtsi
> @@ -296,3 +296,8 @@ &cpu_p20 &cpu_p21 &cpu_p22 &cpu_p23
>  		};
>  	};
>  };
> +
> +&ps_gfx {
> +	// On t6002, the die0 GPU power domain needs both AFR power domains
> +	power-domains = <&ps_afr>, <&ps_afr_die1>;
> +};

Thanks, applied both patches to asahi-soc/dt!

- Hector
