Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A790BA57
	for <asahi@lists.linux.dev>; Thu,  9 Mar 2023 14:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678371544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A46Usveb628ihXLGsrPj6WsAbS9+1+0iaKdpYzar86s=;
	b=OhwB1YDyuUCNsCQTb9esoKNKEyMdFj2HASwmIlCplTP/ZfM+eREGFfYuN+8Y3uCPyHZVdy
	zxDVBOnjqH6vOerDhTzb+aW0NYZMFugUpStNj46PTUjlnvXPrB8JIRlrrgf0ihnBbMgpeN
	7TnI3C3ScYGG9GPUII2ntvQ1iK5M0SM=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-3AjYxz-rMWWE9k0trYNdAw-1; Thu, 09 Mar 2023 09:19:03 -0500
X-MC-Unique: 3AjYxz-rMWWE9k0trYNdAw-1
Received: by mail-vs1-f72.google.com with SMTP id o7-20020a67fc07000000b0041ea097b2ebso702947vsq.10
        for <asahi@lists.linux.dev>; Thu, 09 Mar 2023 06:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A46Usveb628ihXLGsrPj6WsAbS9+1+0iaKdpYzar86s=;
        b=1V/2s0qLu+EnP6rq/82s86qTra+vdoe6Q0x/Vxb1HSTX19b9TIdvevA6QcEUBLVeLT
         JP33m57ymRZw3nv5kBctpZRwpuDkgaSpFb0uWFWNMnISfrUDZ1CxKewYknJPCbu6WtR+
         4pOPguctk4AcCaDpQSY0bTk3nJi2Wz+p6nqyP038dYMoQPVQ4LnK7Z456TCSg/1u5BVP
         ss6xKAadYzcwQExfmKKU0Sd3jtWMlrlUc9uZfRImNES2Jt8oQwuL+BfyAnvR1O31PmP2
         R9a0hiXgDX2Z9+qGtYKN4OXHybVplRk1ioAb7WsOhVYpyJOo3r/wbADVGpXPSaCNR93c
         jzfg==
X-Gm-Message-State: AO0yUKVc0C/0kK4PHbnlfrDxgRC26LoCbfxEOpcTkOK6UFbvmRdgAZbl
	Bo4JajZDVGvFwsQ/M8jkWlzdouINbKu44qnQg4sXNfoNWI6sikpeazayxyIS1DMY1fMUAjy5hQY
	x/iKqXtEPcNzp4aMfnZIlksFgQItt4JA=
X-Received: by 2002:a67:e04d:0:b0:421:edef:20d3 with SMTP id n13-20020a67e04d000000b00421edef20d3mr6995855vsl.7.1678371542417;
        Thu, 09 Mar 2023 06:19:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+GbGL371KUHWTmORXbHN7Tjs6YLLY5zKR/W6HgrEkQUazVrbBuPXLus+wPFvbQmfj/LAVNLJcgkQoUVm3BAxw=
X-Received: by 2002:a67:e04d:0:b0:421:edef:20d3 with SMTP id
 n13-20020a67e04d000000b00421edef20d3mr6995836vsl.7.1678371542065; Thu, 09 Mar
 2023 06:19:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307-apple_pcie_disabled_ports-v2-1-c3bd1fd278a4@jannau.net>
In-Reply-To: <20230307-apple_pcie_disabled_ports-v2-1-c3bd1fd278a4@jannau.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Thu, 9 Mar 2023 14:18:45 +0000
Message-ID: <CAOgh=FzWgjr+3YzF9u1k2ReKEgeoLykPc83RbGqDDXZ_PnGmnQ@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: apple: Set only available ports up
To: Janne Grunau <j@jannau.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Sven Peter <sven@svenpeter.dev>, 
	linux-pci@vger.kernel.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Mar 2023 at 13:43, Janne Grunau <j@jannau.net> wrote:
>
> Fixes following warning inside of_irq_parse_raw() called from the common
> PCI device probe path.
>
>   /soc/pcie@690000000/pci@1,0 interrupt-map failed, using interrupt-controller
>   WARNING: CPU: 4 PID: 252 at drivers/of/irq.c:279 of_irq_parse_raw+0x5fc/0x724
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
> Link: https://lore.kernel.org/asahi/20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net/
> Link: https://lore.kernel.org/asahi/1ea2107a-bb86-8c22-0bbc-82c453ab08ce@linaro.org/
> Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
> Cc: stable@vger.kernel.org
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Janne Grunau <j@jannau.net>

Makes sense.

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
> Changes in v2:
> - rewritten commit message with more details and corrections
> - collected Marc's "Reviewed-by:"
> - Link to v1: https://lore.kernel.org/r/20230307-apple_pcie_disabled_ports-v1-1-b32ef91faf19@jannau.net
> ---
>  drivers/pci/controller/pcie-apple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 66f37e403a09..f8670a032f7a 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -783,7 +783,7 @@ static int apple_pcie_init(struct pci_config_window *cfg)
>         cfg->priv = pcie;
>         INIT_LIST_HEAD(&pcie->ports);
>
> -       for_each_child_of_node(dev->of_node, of_port) {
> +       for_each_available_child_of_node(dev->of_node, of_port) {
>                 ret = apple_pcie_setup_port(pcie, of_port);
>                 if (ret) {
>                         dev_err(pcie->dev, "Port %pOF setup fail: %d\n", of_port, ret);
>
> ---
> base-commit: c9c3395d5e3dcc6daee66c6908354d47bf98cb0c
> change-id: 20230307-apple_pcie_disabled_ports-0c17fb7a4738
>
> Best regards,
> --
> Janne Grunau <j@jannau.net>
>
>

