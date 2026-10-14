Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870724E36CE
	for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 12:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980136; cv=none; b=dgamwEn1je6d2kSiHisaL7HSALoI/N5HPhkpKwFJaX2izLyy0hWvP+gPRYWQLiqnvhna6KXMX7Ou4IAjMMy8NUlIBxIwBrUJTg9Y+gxroIOtZKxd704fr+IETJ0ojU5yDqSjWXCUJZ0bMxeo7q7d8iLgyQSBFDOEIOx9/XrGnRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980136; c=relaxed/simple;
	bh=Ikezn1vsfaFOFxAxkHwfbzIhAdAp+RKLZsFOAngLDoo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oklXkKh8VlJJzjkdJn3pXkVMKONx/a+7BlMhKBd8atz2GtL79dwXsP1Datg3VmU8LX7WBwU4hacHMCargoSlGaP2GgEe2PsGGSeDRpVoTJmm1ujR6Vm7MRLxbefRMrThyAOAy+H9OBBKGHpbshyMvCwKoCtiymCzE8r29fUA8RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckwtbx8E; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckwtbx8E"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48870973bddso2423002f8f.1
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 05:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791980133; x=1792584933; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O0shSTot49RHkwbUZQlg7t0vkhs8LKxmI2yP6wvbvZU=;
        b=ckwtbx8EOrEAZPe9qgFjbAGff/FCFc5UkczaHZJwzxHz11SeG3R9QFXdbDvLEe04/B
         Pvlc5y2b3grhE2tFiY7a9kbDYq4bQj0rDI/3ZfWp74FlTGh2RVb0JI/an49h02cPL4qA
         ORs+34uaPdDcXHZo7b9v+S2W61e8SlE3cOQJtBKLb6OOkeEqwl4YiNJVuUeXj8xBGiAR
         IkFb8hrLHk/2bvJadUG3ubYZSZSHsBZYVitB8nEg2Liq6j0fQgs9IVqP++6AX2Sc0Y+U
         keXn4TLxyKp01DI+bAhTq/J0pOJ/RQfsyGLkeDRh7cBxtE9wCkUICGD3EgvkKM52CXEw
         cgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980133; x=1792584933;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O0shSTot49RHkwbUZQlg7t0vkhs8LKxmI2yP6wvbvZU=;
        b=eLbdRZ9+rOKXZNjlaeusAyOWShjfCojTFzNom3neEU1vqVpkLZ3SYIMRo9G2s40gGw
         PLIp+LERByV0U5psZ+l6rYGVxHRcdhdQ0KanNjRAcaUdMlJROPIZsO75XMSPFaPKimkl
         lUqRpEaUS2P0FdLe5uEVpN/Q+CDbkfUEGfNPu98+oZbLfQ5k0INcu2mVYaHNl7ACIfPX
         P4RsKYFP4XW/bwzowt5QlDTyK76nlJ+2TI6ETdAWmTtwxeJEiTYohKqmsxoFe/WsA5Pq
         B73JXQ8XjRz/0Rwa0XKfu9qaGvuaqJ2Lah4ITIrP6JPFLHK6fE1w371XH5ytN/qxGG7A
         SaiA==
X-Forwarded-Encrypted: i=1; AKwUvBzrnc/9PaHNLcEF0HDvAjvrACpxxDMYC4s/0yPpF9tnC+1NomY4H6/pZIEoEX0ucnw/XhWcnw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLd/U+nUXojpVrmBWRaQLwPAKC88TCNK2j9rPbRymrqDRt/ahUf
	pZBMGSbVWT8g6yGv7vlNT1wqx/ZCT8ZBdefLZQaH3v31SpFldTJ647EPBVdQ3J21x+M=
X-Gm-Gg: AYBFou3OgXsnwL0ZmHpFf+DS2f7G9jDeu4BzlwzCAR2+VfS1T22AUedmppgpds4QUAm
	eZt1q/Fykb9CU1DH1hwjIBUuk225/c/PfHobwW4qLMtyxvahb7QfgcLnkMWkKLK3TBQ8KheY0EA
	gAUJsci0+lXrpbjUwzOocWm4QoNkA/q3xuR9lw4OanXq1SA+RDqOFpP8LWy3aakfhaOmggVcyvB
	fRJmKB4QXt97cyrXhNeSgryE31KdWyvI61BYbY1+7jA5rpkOf4SOloRe7u81QOhG8s9fE8V3OYW
	A45R5+IJ9NoZ+ji1ZUnGWAuasm6qyt/4Hjx6uMUCecLkfLem5j1ZzPwHWtnXmpcQJaM//CaccaX
	Uyr92YzUV0bJ34Asgd6PhLuA+Q7JdP5fznsHKKnZsB0XKelf0VJPFH729hG07KUuBKxXdi/x+n5
	Q4V17kOweBgppHLa+le9ytCxdzD9Z8G/OjypHQGRBy7Cc+1ysw93I44PjhxrVikae8aN7toa+OS
	jnLWRo/UpgDKH9bKBISCPNzDXq1E6EEei+FGmHr4rJ0ZZZglyXz5ww=
X-Received: by 2002:a05:6000:2506:b0:48b:946:c1f7 with SMTP id ffacd0b85a97d-48db94bb90bmr29731276f8f.31.1791980130857;
        Wed, 14 Oct 2026 05:15:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fdbf:f373:6d5b:93e4? ([2a01:e0a:106d:1080:fdbf:f373:6d5b:93e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bd1843sm11655892f8f.56.2026.10.14.05.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:15:30 -0700 (PDT)
Message-ID: <a47f24bb-7c49-4e39-9aac-69da552fb2b0@linaro.org>
Date: Wed, 14 Oct 2026 14:15:28 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Wei Yang <yangwei1@eswincomputing.com>,
 Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
 Hang Cao <caohang@eswincomputing.com>, Li Jun <jun.li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>,
 Yang Xiwen <forbidden405@foxmail.com>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Stanley Chang <stanley_chang@realtek.com>, Ze Huang <huang.ze@linux.dev>,
 Aswath Govindraju <a-govindraju@ti.com>, Roger Quadros <rogerq@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
 <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
 <CAGXv+5H+ZZXnZKB4EzXP0O9f4YGHBHsz3YCRyRJgX9V6RW1eug@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CAGXv+5H+ZZXnZKB4EzXP0O9f4YGHBHsz3YCRyRJgX9V6RW1eug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/26 12:14, Chen-Yu Tsai wrote:
> On Wed, Oct 14, 2026 at 6:44 PM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 10/14/26 11:29, Chen-Yu Tsai wrote:
>>> On Wed, Oct 14, 2026 at 5:28 PM Neil Armstrong
>>> <neil.armstrong@linaro.org> wrote:
>>>>
>>>> On 10/14/26 10:20, Chen-Yu Tsai wrote:
>>>>> The DWC3 controller can operate in host mode. It does so with a XHCI
>>>>> compliant host controller. The XHCI has two downstream ports, one for
>>>>> HS and one for SS. USB downstream ports start from 1, not 0.
>>>>
>>>> Is there something in index 0 we will need to define at some point ?
>>>
>>> On the host side, no. Downstream ports start at 1.
>>>
>>> On the device mode side, I believe the numbers are completely made up.
>>>
>>>> Using 0 as base for numbering in DT isn't incompatible with the USB
>>>> spec using base 1 for numbering,
>>>
>>> But you end up with diverging numbering schemes, and it diverges
>>> from other USB controllers, particularly XHCI, which DWC3 embeds.
>>>
>>> And it also differs from the numbering currently used for directly
>>> connected onboard devices (like hubs), which use or expect the USB
>>> numbering scheme.
>>>
>>> Sure we can make DWC3 "special", drop inclusion of usb-hcd.yaml,
>>> and duplicate the section for onboard devices. On Linux, we can
>>> add some more code to xhci_find_raw_port_number() to make an
>>> exception for DWC3 controllers.
>>>
>>> Also, usb_of_get_connect_type() is already broken for DWC3 based
>>> controllers that only describe the HS connection but not the SS
>>> connection. usb_of_get_connect_type() currently doesn't call
>>> usb_hcd_find_raw_port_number() so both HS and SS get mapped to port 1,
>>> which wouldn't be in the DT since HS is currently port@0. But even if
>>> it did, SS would get mapped to port 2 anyway.
>>>
>>>
>>> IMHO having consistent numbering across controller types would be
>>> better. This avoids making the USB core and hub code deal with more
>>> exceptions, and also easier to understand and write device trees.
>>
>> I was in the impression the port number not necessarily reflects
>> an actual physical numbering, and can be a logical number we would
>> then map in the kernel.
>>
>> I don't see any issue here having base 0 for the bindings and then
>> converting it to base 1 for the XHCI port numbering.
>>
>> Each controller (Host, Device, OTG) will have it's own numbering anyway,
>> so using the XHCI numbering only sounds a bad idea TBH.
> 
> OK. So we keep the port numbering, which is different from the embedded
> device numbering, even for the same dual role controller? See below.
> 
> I hope you see why I think it is confusing.
> 
>>>
>>>>> Reconcile the downstream port numbering with the common USB host
>>>>> binding, renumbering the downstream port numbers from 0 and 1 to
>>>>> 1 and 2.
>>>>>
>>>>> This is non-backwards compatible, however it won't break current
>>>>> major implementations:
>>>>>
>>>>> - dwc3 "gadget mode" in Linux kernel only requires a connection to be
>>>>>      present; it doesn't matter which port it is
>>>>>      - dwc3 "host mode" OF graph connections aren't supported yet [1]
>>>>> - FreeBSD doesn't use the OF graph for anything
>>>>> - U-boot doesn't use the OF graph for USB
>>>>> - OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't use
>>>>>      the OF graph for USB
>>>>> - coreboot doesn't use the OF graph for anything
>>>>> - Zephyr doesn't support dwc3
>>>>> - TF-A doesn't use the OF graph for anything
>>>>> - EDK2 doesn't support dwc3 and doesn't support OF graph
>>>>> - OP-TEE doesn't support dwc3 and doesn't support OF graph
>>>>>
>>>>> [1] WIP to tie OF graph port node to USB port device
>>>>>
>>>>> Fixes: a33113f73693 ("dt-bindings: usb: snps,dwc3: document HS & SS OF graph ports")
>>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>>>> ---
>>>>> It is unclear to me whether the HS/SS numbering is fixed for all dwc3
>>>>> variants. I checked Allwinner H616 and Rockchip RK3588 and they both
>>>>> have HS as port 1 and SS as port 2.
>>>>>
>>>>> This also doesn't cover a potential "multi-port" DWC3 implementation,
>>>>> which Qualcomm seems to have.
>>>>
>>>> It breaks the current Qualcomm numbering on numerous boards.
>>>
>>> Yes. It breaks _everyone_ using the current numbering in the sense that
>>> they are no longer valid, but should not affect actual usage.
>>
>> Older DT are supposed to be working on new kernels, you will break ABI
>> and will break usage if the port numbering is enforced to enabled embedded
>> hubs for example.
> 
> On that front, embedded hubs already require you to use the USB numbering.
> 
> If you write
> 
>      dwc3 {
>          hub@0 {
>              compatible = "usb0123,abcd";
>              reg = "0";
>          };
>      };
> 
> It won't match anything. The current USB HCD binding doesn't prevent you
> from using port 0, but the kernel won't tie the USB device to it, even
> if it is a single port USB controller. As I mentioned, USB downstream
> ports start at 1, even for root hubs that only have 1 downstream port.
> 
> The kernel also doesn't check if the compatible property is correct, but
> that is a separate issue. Maybe it should though, so people can see that
> their DT is incorrect, like if they swapped HS and SS ports for a USB 3.x
> hub.

TBH this USB device bindings for embedded hubs is wrong in many of ways.

So, is the downstream port index a numbering scheme from Linux ? Will each port
will have the same number on every OS implementation ? Do all OSes implement
the root as a the virtual root hub ? do they always use the same indexing ?

My comparison is PCI(e) where the controller port number is a Linux internal
numbering we don't use in DT, we only use the BDF of the downstream bus/endpoints
enumeration which is standardized.

So I think we should actually use the same scheme for usb, but having a subnode
per controller usb port with a hierarchy of nodes representing devices.

Keeping the current USB device bindings and trying to make it work is wrong here.

Neil

> 
> 
> ChenYu
> 
> 
>> Neil
>>
>>>
>>> This comment refers to "multiport" controllers from Qualcomm [1], which
>>> would have ports beyond 1 and 2.
>>>
>>> [1] https://lore.kernel.org/all/20240420044901.884098-8-quic_kriskura@quicinc.com/
>>>
>>>
>>>>> ---
>>>>>     Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++--
>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>>>> index 6c0b8b653824..4b6304bd2ec1 100644
>>>>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>>>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>>>> @@ -410,11 +410,11 @@ properties:
>>>>>           property is used.
>>>>>
>>>>>         properties:
>>>>> -      port@0:
>>>>> +      port@1:
>>>>>             $ref: /schemas/graph.yaml#/properties/port
>>>>>             description: High Speed (HS) data bus.
>>>>>
>>>>> -      port@1:
>>>>> +      port@2:
>>>>>             $ref: /schemas/graph.yaml#/properties/port
>>>>>             description: Super Speed (SS) data bus.
>>>>>
>>>>
>>

