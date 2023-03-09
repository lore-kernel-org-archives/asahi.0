Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C1ED50B
	for <asahi@lists.linux.dev>; Thu,  9 Mar 2023 15:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B989C433AA
	for <asahi@lists.linux.dev>; Thu,  9 Mar 2023 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678375185;
	bh=uGQ4+6pHq7XtriJV3b//hs9AavpLTw/sTULP6Va7e14=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p+Ywt9Ss7qo77YnK/L7v+Jc8782nMY/mf3L6b4i1BQBvzouagzMRVZX5lPqvhTmRa
	 2uuLn8oN7qSGPYgpTrWMsTz19j4UrY603wczoD+HqLQdafKaqTG2On9HS7uyOAB7mo
	 IfBsOOQBP+KrF8rEcHNbOKiwG062NtKYbJ5PfTbXI+GD0krxREj41wvQJOlyaC/c5W
	 dAeJChfEncvrzjmwNfDDzu8AtswL82RyF60M7AsV/eoDz+cAvGj5Rv3zPEWbqKQCNu
	 Ze9H664F5ooqfdgwpYi8y34AdKLKgiJp9DeE2PIW/rUlQLtuBOeKg4u73QvXzA/ELi
	 PDISn4XfgjoTQ==
Received: by mail-vs1-f46.google.com with SMTP id x14so1914587vso.9
        for <asahi@lists.linux.dev>; Thu, 09 Mar 2023 07:19:45 -0800 (PST)
X-Gm-Message-State: AO0yUKUIixgm/nUVKje/eNMIC8h2KI8lF9+3JeHyuoCPPRXj6s/1ZgYT
	02zUHb+r+fq2yi1zSGPrUBGp/UWEli6/s1No+Q==
X-Google-Smtp-Source: AK7set8RGQOVHa/iBNZKJxL7flt/46pZiHDOP14HDqww3nC9X82ZNMZiMhz/FKDiDPM1DFOTBkNd9yGlmJ8gwF5gT1w=
X-Received: by 2002:a67:7302:0:b0:414:2d02:6c96 with SMTP id
 o2-20020a677302000000b004142d026c96mr14391301vsc.7.1678375184277; Thu, 09 Mar
 2023 07:19:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307-apple_pcie_disabled_ports-v2-1-c3bd1fd278a4@jannau.net>
In-Reply-To: <20230307-apple_pcie_disabled_ports-v2-1-c3bd1fd278a4@jannau.net>
From: Rob Herring <robh@kernel.org>
Date: Thu, 9 Mar 2023 09:19:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLd4sR2LRgjLy7ON1qtpaOzMJQ9A_0YkYWG7TPxKtFOcQ@mail.gmail.com>
Message-ID: <CAL_JsqLd4sR2LRgjLy7ON1qtpaOzMJQ9A_0YkYWG7TPxKtFOcQ@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: apple: Set only available ports up
To: Janne Grunau <j@jannau.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Sven Peter <sven@svenpeter.dev>, linux-pci@vger.kernel.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 9, 2023 at 7:36=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> Fixes following warning inside of_irq_parse_raw() called from the common
> PCI device probe path.
>
>   /soc/pcie@690000000/pci@1,0 interrupt-map failed, using interrupt-contr=
oller
>   WARNING: CPU: 4 PID: 252 at drivers/of/irq.c:279 of_irq_parse_raw+0x5fc=
/0x724
>   ...
>   Call trace:
>    of_irq_parse_raw+0x5fc/0x724
>    of_irq_parse_and_map_pci+0x128/0x1d8
>    pci_assign_irq+0xc8/0x140
>    pci_device_probe+0x70/0x188
>    really_probe+0x178/0x418
>    __driver_probe_device+0x120/0x188
>    driver_probe_device+0x48/0x22c
>    __device_attach_driver+0x134/0x1d8
>    bus_for_each_drv+0x8c/0xd8
>    __device_attach+0xdc/0x1d0
>    device_attach+0x20/0x2c
>    pci_bus_add_device+0x5c/0xc0
>    pci_bus_add_devices+0x58/0x88
>    pci_host_probe+0x124/0x178
>    pci_host_common_probe+0x124/0x198 [pci_host_common]
>    apple_pcie_probe+0x108/0x16c [pcie_apple]
>    platform_probe+0xb4/0xdc
>
> This became apparent after disabling unused PCIe ports in the Apple
> silicon device trees instead of deleting them.
>
> Use for_each_available_child_of_node instead of for_each_child_of_node
> which takes the "status" property into account.
>
> Link: https://lore.kernel.org/asahi/20230214-apple_dts_pcie_disable_unuse=
d-v1-0-5ea0d3ddcde3@jannau.net/
> Link: https://lore.kernel.org/asahi/1ea2107a-bb86-8c22-0bbc-82c453ab08ce@=
linaro.org/
> Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
> Cc: stable@vger.kernel.org
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - rewritten commit message with more details and corrections
> - collected Marc's "Reviewed-by:"
> - Link to v1: https://lore.kernel.org/r/20230307-apple_pcie_disabled_port=
s-v1-1-b32ef91faf19@jannau.net
> ---
>  drivers/pci/controller/pcie-apple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Unfortunately, this is a common issue...

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
